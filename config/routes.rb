Rails.application.routes.draw do
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  resources :books
  devise_for :users
  # get 'homes/top'd
  # get 'top' => 'homes#top'
  root to: 'homes#top'
  get '/about'=>'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
