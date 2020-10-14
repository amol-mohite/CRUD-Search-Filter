Rails.application.routes.draw do
  get 'posts/'=> 'posts#bin'
  post 'posts/:id'=> 'posts#soft_delete'
  resources :posts do
    resources :comments
  end
  resources :providers
  root 'providers#index'
end
