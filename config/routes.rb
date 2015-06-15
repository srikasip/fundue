ScraperStore::Application.routes.draw do
  resources :statistics

  get "precision_inputs/date_validation", to: "precision_inputs#date_validation"
  get "precision_inputs/time_validation", to: "precision_inputs#time_validation"
  get "precision_inputs/price_validation", to: "precision_inputs#price_validation"
  get "precision_inputs/address_validation", to: "precision_inputs#address_validation"
  resources :precision_inputs
  post "precision_inputs/saveWrong", to: "precision_inputs#saveWrong"
  post "precision_inputs/saveCorrect", to: "precision_inputs#saveCorrect"

  resources :addresses

  resources :events
  post 'events/jsonListener', :as => :allevents
  post 'events/processedJsonListener', :as => :processedEvents



  root "greetings#home"
  get "greetings/howto"
  resources :eventaggs

  post 'eventaggs/sendParserData', :as => :sendParserData

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
