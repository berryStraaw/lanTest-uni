Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'languages#index'

  get '/user', to: 'user#index'
  get '/user/edit', to: 'user#edit'
  patch '/user', to: 'user#update'

  get '/test', to: 'test#show'
  get '/test/edit', to: 'test#edit'
  patch '/test', to: 'test#update'

  resources :languages

  resources :languages do
    resources :groups, only: :index
  end

  resources :groups do
    resources :words, only: :index
  end

  resources :groups, only: [:new, :create]
  resources :words, only: [:new, :create]
  resources :users, only: [:new, :create]
end
