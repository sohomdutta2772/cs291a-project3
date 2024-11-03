Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to 'users#show_login_form', as: 'login'
  post '/login', to 'users#handle_login'
  delete '/logout', to 'users#handle_logout', as: 'logout'
end
