Rails.application.routes.draw do
  get 'books/new'
  get 'books/index'
  post 'books' => 'books#create'
  get 'books/show'
  get 'books/edit'
  devise_for :users
 root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homes/about" => "homes#about", as: "about"
end
