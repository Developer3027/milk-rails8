Rails.application.routes.draw do
  # get "hermits/index"
  # get "swabbies/home"
  devise_for :milk_admins, skip: [ :registrations ]

  # root for milk admin
  authenticated :milk_admin do
    root to: "milk_admin#dashboard", as: :milk_admin_root
    get "milk_blog", to: "milk_admin#admin_milk_blog", as: :milk_blog
  end

  # root for hermits
  get "hermits", to: "hermits#index", as: :hermits
  # root for swabbies
  get "swabbies", to: "swabbies#index", as: :swabbies
  # root for saltandtar
  get "saltandtar", to: "swabbies#saltandtar", as: :saltandtar
  # root for eastbounds
  get "eastbound", to: "eastbounds#index", as: :eastbound
  # root for copywriter
  get "copywriter", to: "copywriter#index", as: :copywriter

  get "info", to: "static_pages#info", as: :info
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
