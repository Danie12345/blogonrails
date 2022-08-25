Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get "/users", to: "users#index"
  root to: "users#index"
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :new, :create, :show, :delete] do
      resources :comments, only: [:create, :delete]
      resources :likes, only: [:create]
    end
  end
end
