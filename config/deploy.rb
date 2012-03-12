# encdoing:utf-8
# У вас должна быть настроена авторизация ssh по сертификатам

set :application, "demo"

# настройка системы контроля версий и репозитария, по умолчанию - git, если используется иная система версий, нужно изменить значение scm
set :scm, :git
set :repository,  "git://github.com/secret-development/real-box.git"

set :user, "hosting_lagox"
set :use_sudo, false
set :deploy_to, "/home/hosting_lagox/projects/demo"


role :web, "lithium.locum.ru"   # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"   # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run
set :deploy_via, :remote_cache

# эта секция для того, чтобы вы не хранили доступ к базе в системе контроля версий. Поместите dayabase.yml в shared,
# чтобы он копировался в нужный путь при каждом выкладывании новой версии кода
# так лучше с точки зрения безопасности, но если не хотите - прсото закомментируйте этот таск


# Если хотите поместить конфиг в shared и не хранить его в системе контроя версий - раскомментируйте следующие строки

after "deploy:update_code", :copy_database_config

task :copy_database_config, roles => :app do
 db_config = "#{shared_path}/database.yml"
 run "cp #{db_config} #{release_path}/config/database.yml"
end

# for carrierwave
after "deploy:update_code", :symlink_shared
task :symlink_shared, roles => :app do
  run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
end

after "deploy:update_code", :seed
task :seed do
  puts "\n\n=== Populating the Production Database! ===\n\n"
  run "cd #{deploy_to}/current; rvm use 1.9.3 do bundle exec rake RAILS_ENV=production db:migrate"
end

set :unicorn_conf, "/etc/unicorn/demo.lagox.rb"
set :unicorn_pid, "/var/run/unicorn/demo.lagox.pid"



set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use 1.9.3 do bundle exec unicorn_rails -Dc #{unicorn_conf})"

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:assets_precompile"
after "deploy:assets_precompile", "deploy:restart"

# - for unicorn - #
namespace :deploy do
  desc "Bundle install"
  task :bundle_gems, :roles => :app do
    run "cd #{deploy_to}/current && rvm use 1.9.3 do bundle install --path ../../shared/gems"
  end
  
  desc "assets precompile"
  task :assets_precompile, :roles => :app do
    run "cd #{current_path} && rvm use 1.9.3 do bundle exec rake assets:precompile RAILS_ENV=productionv"
  end
  
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end