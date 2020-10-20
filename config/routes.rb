Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :users, only: [:show, :edit, :index]
  resources :favorites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
