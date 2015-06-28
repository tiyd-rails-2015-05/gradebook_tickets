Rails.application.routes.draw do
  #footer-----------------
  get 'terms-and-conditions' => 'pages#terms'
  get 'privacy-policy' => 'pages#privacy'
  get 'about' => 'pages#about'
  get 'career' => 'pages#career'
  #------------------------
  resources :api_keys
  get 'api_keys/new'
  get 'api_keys/create'
  post 'api_keys/create'
  get 'api_keys/show'


  get 'dashboard/student'
  get 'dashboard/parent'
  get 'dashboard/teacher'


  get 'sessions/login'
  post 'sessions/login'
  get 'sessions/logout'

  resources :assignments do
    member do
      patch 'update_grades'
    end
  end
  resources :grades
  resources :parents
  resources :students
  resources :teachers

  get 'dashboard/index'
  root 'dashboard#index'

  get 'api/v1/teachers' => 'teachers#index'
  get 'api/v1/teachers/:id' => 'teachers#show'
  get 'api/v1/students' => 'students#index'
  get 'api/v1/students/:id' => 'students#show'
  get 'api/v1/assignments' => 'assignments#index'
  get 'api/v1/assignments/:id' => 'assignments#show'
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
