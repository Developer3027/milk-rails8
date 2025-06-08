Rails.application.routes.draw do
  devise_for :users
  # get "hermits/index"
  # get "swabbies/home"
  get "static_pages/plan"
  devise_for :milk_admins, skip: [ :registrations ]

  # root for milk admin
  authenticated :milk_admin do
    root to: "milk_admin#dashboard", as: :milk_admin_root
  end

  # Admin Routes
  namespace :milk_admin do
    resources :blog_categories

    resources :blogs, only: [ :index, :new, :create, :edit, :update, :destroy ] do
      member do
        delete :destroy_image
      end
    end

    resources :projects, only: [ :index, :new, :create, :edit, :update, :destroy ] do
      member do
        delete :destroy_image
      end
    end

    resources :songs, only: [ :index, :new, :create, :edit, :update, :destroy ] do
      member do
        delete :destroy_image
        delete :destroy_file
      end
    end

    resources :pills, only: [ :index, :new, :create, :edit, :update, :destroy ]
  end

  # Public Blog Routes
  resources :blogs, only: [ :index, :show ], controller: "blogs", param: :slug do
    collection do
      get "feature"  # This creates the route for /blogs/feature
      get "categories/:id", action: :index, as: :category # adds category_blogs_path
    end
  end

  # Public Zuke routes
  resources :zuke, only: [ :index ], controller: "zuke" do
    collection do
      get "music", to: "zuke#music", as: :music_list  # This creates the route for /zuke/music
      get "artists", to: "zuke#artists", as: :music_artists
      get "albums", to: "zuke#albums", as: :music_albums
      get "genres", to: "zuke#genres", as: :music_genres
      get "about", to: "zuke#about", as: :music_about
    end
  end


  # root for hermits
  get "hermit-plus", to: "hermit_plus#landing", as: :hermits
  # root for swabbies
  get "swabbies", to: "swabbies#index", as: :swabbies
  # Public Salt and Tar routes
  resources :salt_and_tar, only: [ :index ], path: "salt-and-tar", controller: "salt_and_tar" do
    collection do
      get "archive", to: "salt_and_tar#archive", as: :archive  # /salt-and-tar/archive
    end
  end
  # root for eastbounds
  get "eastbound", to: "eastbounds#index", as: :eastbound
  # root for public route, copywriter
  get "copywriter", to: "copywriter#index", as: :copywriter


  get "info", to: "static_pages#info", as: :info

  post "contact", to: "static_pages#create_contact", as: :contact
  delete "contacts/:id", to: "static_pages#destroy_contact", as: "delete_contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "static_pages#index"
end
