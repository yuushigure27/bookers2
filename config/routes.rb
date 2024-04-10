Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  get '/home/about', to: 'homes#about'
  resources :books, only: [:index, :show, :edit, :destroy, :update, :create]
  resources :users, only: [:index, :show, :edit, :destroy, :update, :create]

end
