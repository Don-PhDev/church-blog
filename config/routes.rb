Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end

  root "posts#index"

  get '*path', to: 'application#routing_error'
end
