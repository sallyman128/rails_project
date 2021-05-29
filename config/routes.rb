Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :paintings, only: [:index, :show, :new, :create]
  resources :galleries do
    resources :paintings, only: :new
  end

  resources :users, only: [:show, :new, :create, :destroy] do
    resources :galleries, only: :index
    resources :paintings, only: :index
  end

  get "/search", to: "paintings#search", as: "search_paintings"

  get "/signin", to: "sessions#signin"
  post "/login", to: "sessions#login"
  post "/logout", to: "sessions#logout"
  get '/auth/facebook/callback' => 'sessions#omniauth_login'
end
