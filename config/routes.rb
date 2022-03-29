Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "pages/about", to: "pages#about"
  get "pages/contact", to: "pages#contact"

  resources :posts do
    resources :comments
  end

  root "pages#index"
end
