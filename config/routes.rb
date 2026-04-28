Rails.application.routes.draw do
  get 'messages/create'
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
  resources :orders do
    resources :messages, only: [:create]
  end
  resources :services
  resources :contacts
  resources :frontoffices
  resources :works do
    resources :comments
  end
  #resources :messages
  # Defines the root path route ("/")
  # root "articles#index"
end
