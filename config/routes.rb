Rails.application.routes.draw do



  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create", as: :posts
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id" => "posts#show"
  patch "posts/:id" => "posts#update", as: :post
  post "posts/:id/destroy" => "posts#destroy"


  get "signnup" => "users#new"
  post "users/create" => "users#create", as: :users
  post "login_guest" => "users#login_guest"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  patch "users/:id/update" => "users#update", as: :user
  post "users/:id/destroy" => "users#destroy"

  root "home#top"

end
