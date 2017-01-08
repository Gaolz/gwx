# == Route Map
#
#            Prefix Verb   URI Pattern                     Controller#Action
#              root GET    /                               home#index
#               tag GET    /tags/:tag(.:format)            posts#index
#             posts GET    /posts(.:format)                posts#index
#              post GET    /posts/:id(.:format)            posts#show
#             photo POST   /photo(.:format)                photos#upload
#         admin_tag GET    /admin/tags/:tag(.:format)      admin/posts#index
#       admin_posts GET    /admin/posts(.:format)          admin/posts#index
#                   POST   /admin/posts(.:format)          admin/posts#create
#    new_admin_post GET    /admin/posts/new(.:format)      admin/posts#new
#   edit_admin_post GET    /admin/posts/:id/edit(.:format) admin/posts#edit
#        admin_post GET    /admin/posts/:id(.:format)      admin/posts#show
#                   PATCH  /admin/posts/:id(.:format)      admin/posts#update
#                   PUT    /admin/posts/:id(.:format)      admin/posts#update
#    admin_sessions POST   /admin/sessions(.:format)       admin/sessions#create
# new_admin_session GET    /admin/sessions/new(.:format)   admin/sessions#new
#     admin_session DELETE /admin/sessions/:id(.:format)   admin/sessions#destroy
#        admin_root GET    /admin(.:format)                admin/home#index
#             about GET    /about(.:format)                home#about
#

Rails.application.routes.draw do
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
  root 'home#index'

  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts, only: [:show, :index]

  post 'photo' => 'photos#upload'

  namespace :admin do
    get 'tags/:tag', to: 'posts#index', as: :tag
    resources :posts, except: [:destroy]
    resources :sessions, only: [:new, :create, :destroy]
    root to: 'home#index', as: :root

    concern :paginatable do
      get '(page/:page)', :action => :index, :on => :collection, :as => ''
    end

    resources :accounts
    resources :settings
    resources :users
    resources :words, concerns: :paginatable
  end

  get 'about' => 'home#about', as: :about
  get 'book' => 'home#book'

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
