Rails.application.routes.draw do
  # get 'post_image/new'
  # get 'post_image/index'
  # get 'post_image/show'

  resources :post_image, only: [:show, :edit,:index]
  # get 'books/new'
#   get 'books/index'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  get 'books/:id/new' => 'books#new', as: 'new_book'
   get 'books/:id' => 'books#show', as: 'show_book'
   get 'books/:id/edit'  => 'books#edit' , as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
   delete 'books/:id' => 'books#destroy', as: 'destroy_book'
# resources :book, only: [:show, :edit,:update,:destroy,:create]

  devise_for :users
 root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homes/about" => "homes#about", as: "about"
end
