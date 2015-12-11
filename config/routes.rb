Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'user/show'
  get 'my_page/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'home/index'
  post 'home/search'
  post 'home/create'
  get 'home/search/:q' => 'home#search', constraints: { q: /.*/ }
  get 'home/movie'
  get 'home/movie/:id' => 'home#movie'
  get 'home/movie/:id/:num' => 'home#movie'
  get 'home/about'
  get '/admin' => 'admin/base#index'
  get 'welcome' => 'welcome#index'
  get 'user/:id' => 'user#show', constraints: { id: /[0-9]+/ }
  # get 'sign_in', :to => 'devise/sessions#edit', :as => :edit_user_registration

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  #root 'home#index'
  if Rails.env.test?
    get '/rails/mailers'      , to: "rails/mailers#index"
    get '/rails/mailers/*path', to: "rails/mailers#preview", as: 'mail_preview'
  end


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
