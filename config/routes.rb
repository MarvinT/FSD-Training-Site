Fsd::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'lessons#index'

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match 'lessons/:id/addVideo' => 'lessons#addVideo'

  match 'lessons/:id/setsize' => 'lessons#setsize'

  match 'lessons/reorder' => 'lessons#reorder'

  scope '/auth' do
    match '/admin', :as => :login
    match '/admin/callback', :to => 'sessions#authenticate_admin'
    match '/failure', :to => 'sessions#admin_authentication_failure'
    match '/admin/logout', :to => 'sessions#logout_admin', :as => :logout
  end

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :lessons do
    resources :prezis, :documents, :videos, :comments do
      collection do
        post "sort"
        end
    end
    collection do
      post "sort"
    end
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
