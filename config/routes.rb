ExigentiamRms::Application.routes.draw do
  root to: 'application#index'

  devise_for :users

  resources :comments


  resources :artifact_statuses


  resources :artifact_types


  resources :links do
    member do
      get 'resolve_suspicion'
    end
  end

  match 'suspicious_links' => 'links#suspicious_links', as: 'suspicious_links'


  resources :link_schemas


  resources :artifacts do
    member do
      get 'history'
      get 'link'
      get 'links'
      get 'remove_incoming'
      get 'remove_outcoming'
    end
    collection do
      get 'traceability'
      get 'change_direction'
      get 'remove_link'
    end
  end

  match 'coverage_analysis' => 'artifacts#coverage_analysis', as: 'coverage_analysis'

  resources :changes do
    collection do
      get 'compare'
    end
  end


  resources :projects do
    member do
      get 'select'
    end
  end


  resources :users

  resources :attachments, :only => [:index, :create, :destroy]

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
