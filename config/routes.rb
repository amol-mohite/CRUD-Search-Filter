Rails.application.routes.draw do
  devise_for :users
  resources :providers
  root 'providers#index'
end
