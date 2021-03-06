Rails.application.routes.draw do
  get 'soccerbets/index'

  get 'soccerbets/new'

  get 'sports/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'bets/index'

  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'user' => 'user#index'
  patch 'user' => 'user#update'

  root to: "home#index"

  resources :users, only: [] do
    resources :portfolios, only: [:index]
  end

  resources :portfolios, only: [:show, :new, :create, :update, :destroy]
  resources :currencies, only: :index

  resources :soccerbets, only: [:index, :new, :create, :show, :update]

  resources :bets, only: [:new, :index, :show, :create, :update]

  # resources :questions, shallow: true do
  #
  #   resources :answers, only: [:create, :destroy]
  #   resources :likes, only: [:create, :destroy]
  #   resources :votes, only: [:create, :update, :destroy]
  # end


  # resources :sessions, only: [:new, :create] do
  #   delete :destroy, on: :collection
  # end


end
