Rails.application.routes.draw do
  resources :categories
  resources :items

  # users
  get "/login", to: "users#login"
  post "/login", to: "users#signin"
  delete "/logout", to: "users#logout"
  get "/sign_up", to: "users#signup"
  post "/sign_up", to: "users#register"  

  root "welcome#index"
end
