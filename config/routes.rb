Rails.application.routes.draw do
  get 'tags/:tag', to: 'solutions#index', as: :tag
  get 'votes/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users 
  root to: 'users#index'
  resources :tutorials
  resources :solutions
  resources :votes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
