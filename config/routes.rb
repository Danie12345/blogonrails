Rails.application.routes.draw do
  get "/users", to: "users#index"
  root to: "users#index"
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :new, :show]
  end
end
