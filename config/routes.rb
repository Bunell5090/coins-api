Rails.application.routes.draw do
  
#coins
get "/coins" => "coins#index"
get "/coins:id" => "coins#show"
post "/coins" => "coins#create"
patch "/coins/:id" => "coins#update"
delete "/coins/:id" => "coins#destroy"

#collection
get "/collection" => "collection#index"
get "/collection:id" => "collection#show"
post "/collection" => "collection#create"
patch "/collection/:id" => "collection#update"
delete "/collection/:id" => "collection#destroy"

#wishlist

get "/wishlist" => "wishlist#index"
get "/wishlist:id" => "wishlist#show"
post "/wishlist" => "wishlist#create"
patch "/wishlist/:id" => "wishlist#update"
delete "/wishlist/:id" => "wishlist#destroy"

#users
get "/users" => "users#index"
get "/users:id" => "users#show"
post "/users" => "users#create"
patch "/users/:id" => "users#update"
delete "/users/:id" => "users#destroy"

#sessions
post "/sessions" => "sessions#create"
end
