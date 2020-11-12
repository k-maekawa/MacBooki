Rails.application.routes.draw do


  devise_for :users
  get "login" => "users#login_form"


  post "login" => "users#login"
  post "logout" => "users#logout"


  post "users/:id/update" => "users#update"

  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "singnup" => "users#new"
  post "users/index" => "users#index"
  get "users/index" => "users#index"
  get "users/:id" => "users#show", as: :user

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show", as: :post

  resources :comments, only: [:create,:destroy]


  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"

  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"
  get "about" => "home#about"

  get "contact/new" => "contact#new"

end
