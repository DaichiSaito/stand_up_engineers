# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get '/home/terms', to: 'home#terms'
  get '/home/privacy', to: 'home#privacy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resource :clocks
  end
end
