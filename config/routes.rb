Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/users', to: 'users#index'
  root to: 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end
end
