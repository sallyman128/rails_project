Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :paintings, only: :index

  get "/signin", to: "sessions#signin"
  post "/login", to: "sessions#login"
  post "/logout", to: "sessions#logout"
end
