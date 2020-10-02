Rails.application.routes.draw do
  
  devise_for :users
  get "login" => "users#login_form"
  
 
  post "login" => "users#login"
  post "logout" => "users#logout"
  

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "singnup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
   
  resources :comments, only: [:create]
  
  
  post "posts/create" => "posts#create"

  get "posts/:id/edit" => "posts#edit"
  
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"
  get "about" => "home#about"
  
end
