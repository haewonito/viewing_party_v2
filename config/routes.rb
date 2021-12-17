Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"

  get "/register", to: "users#new"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login_user"

  get "/dashboard", to: "users#show"

  resources :users do
    resources :discover
  end

  resources :users do
    resources :movies
  end
end
