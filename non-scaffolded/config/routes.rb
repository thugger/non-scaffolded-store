Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #http verbs
#get, post, patch, delete

  root to: 'products#index'

  #resources :products would build 7 routes for RESTful products, show below for create/read/update/edit/destroy
  # only[:symbol, :symbol, etc] limits the routes that are made
  # constraints: {symbol: /regex/} allows for generic contstraints

  #roy fielding, look up his thesis for restful, also "how I explained rest to my wife"
  #Create routes
  #get   'products/new',     to: 'products#new', as: 'new_product'      #show new product form
  #post  'products',  to: 'products#create'   #create the new product

  #read routes
  #get 'products/index' in this case the url has to match the file path
  get   'products',         to: 'products#index'    #show all products
  get   'products/:id',     to: 'products#show',     as: 'product', id: /\d+/ #show a specific product

  #get 'products/:id/edit',   to: 'products#edit', as: 'edit_product', id: /\d+/
  #patch 'products/:id',      to: 'products#update', id: /\d+/

  #delete 'products/:id' => 'products#destroy', id: /\d+/, as: 'destroy_product'
  





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
