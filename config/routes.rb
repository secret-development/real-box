# -*- encoding : utf-8 -*-
Crm::Application.routes.draw do

  get "report" => "report#index", :as => "report"

  get "sign_in" => "sessions#new", :as => "sign_in"
  get "sign_out" => "sessions#destroy", :as => "sign_out"

  get "sign_up => " "users/new", :as => "sign_up"
  resources :users do
    get 'add_info', :on => :member, :as => :add_info
  end
  resource :sessions
  resource :password_resets

  get "potentials/index"
  match "potentials" => "potentials#index", :as => :potentials
  resources :tasks  
  resources :customers do
    get 'all', :on => :collection
    post 'lastcallcustomer', :on => :collection
  end
  
  resources :subjects do
    resources :photos, :only => [:create, :destroy]
    get 'add_properties', :on => :member, :as => :add_properties
    get 'add_photo', :on => :member, :as => :add_photo
    post 'findtypesubject', :on => :collection
    post 'load_attr', :on => :collection
    # scopes:
    get 'active', :on => :collection
    get 'inactive', :on => :collection
  end
  
  resources :transactions do
    resources :documents, :only => [:create, :destroy]
    get 'add_document', :on => :member, :as => :add_document
  end
  resources :cities, :except => [:show]
  resources :social_statuses, :except => [:show]
  resources :condition_fields
  resources :value_fields, :except => [:show]
  resources :typesubjects, :except => [:show]
  # settings
  match "settings" => "settings#index", :as => :settings
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
