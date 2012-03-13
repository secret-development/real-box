# encdoing:utf-8

# set up
set :application, "demo"
set :scm, :git
set :repository,  "git://github.com/secret-development/real-box.git"

set :user, "hosting_lagox"
set :use_sudo, false
set :deploy_to, "/home/#{user}/projects/#{application}"
set :keep_releases, 5

role :web, "lithium.locum.ru"
role :app, "lithium.locum.ru"
role :db,  "lithium.locum.ru", :primary => true
set :deploy_via, :remote_cache
set :unicorn_conf, "/etc/unicorn/demo.lagox.rb"
set :unicorn_pid, "/var/run/unicorn/demo.lagox.pid"
set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use 1.9.3 do bundle exec unicorn_rails -Dc #{unicorn_conf})"


# database.yml
after "deploy:update_code", :copy_database_config
task :copy_database_config, roles => :app do
  puts "\n\n-------------- Copy database.yml --------------\n\n"
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
  puts "\n\n-------------- end copy database.yml --------------\n\n"
end

# for carrierwave
after "deploy:update_code", :symlink_shared
task :symlink_shared, roles => :app do
  puts "\n\n-------------- Symlink shared --------------\n\n"
  run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  puts "\n\n-------------- end symlink shared --------------\n\n"
end

after "deploy:update_code", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:migrate"
after "deploy:migrate", "deploy:seed"
after "deploy:seed", "deploy:ascomplie"
after "deploy:ascomplie", "deploy:restart"

# - for unicorn - #
namespace :deploy do
  
  # bundle install
  desc "Bundle install"
  task :bundle_gems, :roles => :app do
    puts "\n\n-------------- Bundle install --------------\n\n"
    run "cd #{current_path}; rvm use 1.9.3 do bundle install --path ../../shared/gems"
    puts "\n\n-------------- end bundle install --------------\n\n"
  end
  
  # migrate
  desc "Migrations db"
  task :migrate, :roles => :app do
    puts "\n\n-------------- Migrate --------------\n\n"
    run "cd #{current_path}; rvm use 1.9.3 do bundle exec rake RAILS_ENV=production db:migrate"
    puts "\n\n-------------- end migrate --------------\n\n"
  end
  
  # seed
  desc "Seeding data"
  task :seed do
    puts "\n\n-------------- Seeding --------------\n\n"
    run "cd #{current_path}; rvm use 1.9.3 do bundle exec rake RAILS_ENV=production db:seed"
    puts "\n\n-------------- end seed --------------\n\n"
  end
  
  # assets
  desc "Compile assets"
  task :ascomplie, :roles => :app do
    puts "\n\n-------------- Compile assets --------------\n\n"
    run "cd #{current_path}; rvm use 1.9.3 do bundle exec rake assets:precompile RAILS_ENV=production"    
    puts "\n\n-------------- end assets --------------\n\n"
  end
  
  desc "Start application"
  task :start, :roles => :app do
    puts "\n\n-------------- Start app --------------\n\n"
    run unicorn_start_cmd
    puts "\n\n-------------- end start app --------------\n\n"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    puts "\n\n-------------- stop app --------------\n\n"
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
    puts "\n\n-------------- end stop app --------------\n\n"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    puts "\n\n-------------- Restart --------------\n\n"
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
    puts "\n\n-------------- end restart --------------\n\n"
  end
end