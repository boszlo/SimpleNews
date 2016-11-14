Rails.application.routes.draw do
  resources :authors
  resources :articles
  resources :categories
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  authenticate :user do
    resources :articles, only: [:new, :edit, :update, :destroy]
    resources :categories, only: [:new, :edit, :update, :destroy]
    resources :authors
  end
  root to: 'articles#index'
end
