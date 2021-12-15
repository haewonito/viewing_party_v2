Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"

  get "/register", to: "users#new"

  resources :users do
    resources :discover
  end

  resources :users do
    resources :movies
  end
end
