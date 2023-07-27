# frozen_string_literal: true

Rails.application.routes.draw do
  root 'languages#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  get '/user', to: 'user#index'
  get '/user/edit', to: 'user#edit'
  patch '/user', to: 'user#update'

  resources :languages

  resources :tests do
    member do
      patch :update_input
    end
  end
  resources :languages do
    resources :groups, only: %i[index destroy]
  end

  resources :groups, only: [] do
    resources :words, only: %i[index destroy]
  end

  get '/words', to: 'words#index'

  resources :groups, only: %i[new create]
  resources :words, only: %i[new create]
  resources :users, only: %i[new create]

  resources :performances, only: [:index, :show]
end
