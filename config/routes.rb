Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    resources :articles, only: [:new, :edit, :update, :destroy]
  end
  resources :articles
  root to: 'articles#index'
end
