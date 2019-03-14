Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'user/registrations' }

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'price_update', to: 'stocks#update'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'

  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships
end
