Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "main#index"

  resources :backoffices do
    member do
      patch :toggle_active
      patch :toggle_completed
    end
  end
  resources :orders
  # Defines the root path route ("/")
  # root "articles#index"
end
