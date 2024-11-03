Rails.application.routes.draw do
  root 'posts#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "create_post" => "post#create_post_page"
  post "handle_create_post" => "post#handle_create_post"

  # Defines the root path route ("/")
  root "post#index"
  
  get 'login', to 'users#show_login_form', as: 'login'
  post '/login', to 'users#handle_login'
  delete '/logout', to 'users#handle_logout', as: 'logout'
end
