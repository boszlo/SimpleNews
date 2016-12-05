Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  authenticate :user do
    resources :articles, only: [:new, :edit, :update, :destroy]
    resources :categories, only: [:new, :edit, :update, :destroy]
    resources :authors, except: [:show]
  end
  resources :authors
  resources :articles
  resources :categories
  root to: 'articles#index'
  get 'search', to: 'search#search'
end
