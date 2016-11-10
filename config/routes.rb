Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  authenticate :user do
    resources :articles, only: [:new, :edit, :update, :destroy]
    resources :categories, only: [:new, :edit, :update, :destroy]
  end
  resources :articles
  resources :categories
  root to: 'articles#index'
end
