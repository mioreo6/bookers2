Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :update]
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end