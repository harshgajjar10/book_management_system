Rails.application.routes.draw do
  root to: "books#index"
  devise_for :users
  resources :books do
    member do
      post 'toggle_favorite', to: "books#toggle_favorite"
    end
  end
  resources :users
  resources :authors
  resources :categories
end
