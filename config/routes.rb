Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "create_post" => "post#create_post_page"
  post "handle_create_post" => "post#handle_create_post"
  get "post/:id" => "post#view_post", as: :post

  get "post/:id/edit" => "post#edit_post", as: :edit_post
  patch "post/:id" => "post#update_post", as: :update_post
  delete "post/:id" => "post#delete_post", as: :delete_post

  get 'login' => 'user#show_login_form', as: 'login'
  post 'login' => 'user#handle_login'
  get 'logout' => 'user#handle_logout', as: 'logout'

  post "add_comment" => "comment#add_comment"

  # Defines the root path route ("/")
  root "post#index"
  
end
