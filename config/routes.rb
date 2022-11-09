Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    resources :comments, only: :create
    resource :likes, oniy: [:create, :destroy]
  end
end