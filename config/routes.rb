Rails.application.routes.draw do


  get 'meetings/print_calendar'
  get 'meetings/print_table'
  get 'meetings/print_chart'
  resources :profiles
  devise_for :users, controllers: {registrations: "registrations"}
  
  resources :plans do
    resources :assignments
  end

  resources :meetings do
    resources :plans
  end

  

  get 'assignments/mark_as_complete'
  get 'assignments/mark_as_incomplete'
  get 'assignments/mark_as_pending'

  resources :priorities
  resources :categories
  resources :activities
  resources :statuses
  resources :plan_categories
  resources :assignment_users
  resources :meeting_users
  resources :assignments
  resources :plans
  resources :meetings
  resources :companies
  resources :plan_assignments

  
  root 'home#index'

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
