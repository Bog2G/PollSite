Rails.application.routes.draw do
  get 'votes/create'
  resources :questions
  resources :polls
  resources :votes
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    root 'polls#index', as: :authenticated_root
  end
  root 'main#home'

  # Defines the root path route ("/")
  # root "articles#index"
end
