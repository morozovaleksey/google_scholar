Rails.application.routes.draw do
  get 'persons/profile'

  devise_for :users
  post 'main/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'
  post 'parse', to: 'google_parse#google_response'
  post 'get_number_page', to: 'google_parse#get_number_page'
  post 'evaluate_accuracy', to: 'search_efficiency#evaluate_accuracy'
  post 'search_efficiency', to: 'search_efficiency#evaluation_efficiency'
  get 'add_to_query', to: 'search_efficiency#add_to_query'
  get 'get_relevance', to: 'search_efficiency#get_relevance'
  get 'related_subjects', to: 'related_list#related_subjects_list'
  get 'related_terms', to: 'related_terms#related_terms_list'
  get 'comparison_queries', to: 'comparison_queries#comparison'
  get 'persons/profile', as: 'user_root'
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
