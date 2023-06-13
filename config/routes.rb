Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # resources :books
  devise_for :users
  # get 'homes/top'd
  # get 'top' => 'homes#top'
  root to: 'homes#top'
  get '/about'=>'homes#about'
    resources :books, only: [:show, :edit, :index, :create, :new, :destroy]
  resources :users, only: [:show, :edit, :index, :update, :create,]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
