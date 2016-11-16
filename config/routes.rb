Rails.application.routes.draw do

  resources :cards
  resources :compras

    
  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/edit'

  get 'comments/create'

  get 'comments/update'

  get 'comments/destroy'

  get 'postulaciones/index'

  get 'postulaciones/show'

  get 'postulaciones/new'

  get 'postulaciones/edit'

  get 'postulaciones/create'

  get 'postulaciones/update'

  get 'postulaciones/destroy'

  get 'postulacion/index'

  get 'postulacion/show'

  get 'postulacion/new'

  get 'postulacion/edit'

  get 'postulacion/create'

  get 'postulacion/update'

  get 'postulacion/destroy'

  get 'usuarios/new'

  get 'usuarios/show'

  get 'usuarios/edit'

  get 'usuarios/index'

  get 'usuarios/create'

  get 'usuarios/update'

  get 'usuarios/destroy'

  resources :logros

  resources :favors do
    get "mis_favores", on: :collection
  end

  #get 'welcome/index'

  root 'home#index'
   #resources :welcome
  
  devise_for :users, controllers: { registrations: "registrations" } 
  
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
