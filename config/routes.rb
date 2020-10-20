Rails.application.routes.draw do
  resources :movies
  resources :users
  resources :favorites
  resources :reviews
  delete '/sessions/reset_page_count', to: 'sessions#reset_page_count', as: 'reset_page_count'

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'

  post '/sessions/new_login', to: 'sessions#login'
end
