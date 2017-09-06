Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
    end
  end

  resources :books, only: [:index]
end
