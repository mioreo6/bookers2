Rails.application.routes.draw do


  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create]
  resources :users, only: [:show, :edit]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
