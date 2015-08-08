Rails.application.routes.draw do
  root 'static_pages#home'

  post 'login' => 'static_pages#login', as: :login

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'menucard' => 'menucard#show', as: :menucard

  get 'orders/table' => 'orders#index_by_table', as: :index_by_table

  get 'orders/table/id' => 'orders#index_by_table_id', as: :index_by_table_id

  get 'orders/waiters' => 'orders#index_by_waiter', as: :index_by_waiter

  get 'orders/waiters/id' => 'orders#index_by_waiter_id', as: :index_by_waiter_id

  get 'orders/food' => 'orders#index_by_food', as: :index_by_food

  get 'orders/food/id' => 'orders#index_by_food_id', as: :index_by_food_id

  post 'order/:id/deliver' => 'orders#deliver', as: :deliver_order

  get 'customers/select' => 'customers#select', as: :select_customer

  get 'customers/generate_bill' => 'customers#generate_bill', as: :generate_bill

  get 'food/new' => 'menucard#new_food', as: :new_food

  post 'food/create' => 'menucard#create_food', as: :foods

  get 'foods/:id/edit' => 'menucard#edit_food', as: :edit_food

  patch 'foods/:id' => 'menucard#update_food', as: :food

  delete 'foods/:id' => 'menucard#delete_food'

  get 'orders/deliver' => 'orders#deliver_select', as: :order_deliver_select

  post 'orders/:id/deliver' => 'orders#deliver', as: :order_deliver

  get 'customers/leave' => 'customers#leave_select', as: :customer_leave_select

  post 'customers/:id/leave' => 'customers#leave', as: :customer_leave

  get 'reports' => 'reports#reports', as: :reports

  get 'reports/all' => 'reports#all', as: :all_reports

  get 'reports/food' => 'reports#food', as: :food_reports

  get 'reports/waiter' => 'reports#waiter', as: :waiter_reports

  get 'reports/table' => 'reports#table', as: :table_reports

  get 'waiters/edit_select' => 'waiters#edit_select', as: :edit_waiter_select

  get 'waiters/delete_select' => 'waiters#delete_select', as: :delete_waiter_select

  get 'tables/delete_select' => 'tables#delete_select', as: :delete_table_select

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :customers, except: [:edit, :update, :index]

  resources :orders

  resources :tables

  resources :waiters

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
