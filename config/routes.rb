Rails.application.routes.draw do

  get 'votes/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :tutorials
  resources :solutions
  root to: 'users#index'
  resources :votes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
