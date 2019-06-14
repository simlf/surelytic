Rails.application.routes.draw do

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.role == 'admin' } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :organization, only: [:show] # opt. :edit, :update

  namespace :organization, module: :organizations do
    resources :users, only: [:new, :create]
  end

  resources :projects, only: [:show, :new, :create] do # opt. :index, :edit, :update // :destroy
    resources :tests, only: [:show, :new, :create, :edit, :update] # opt. // :destroy
  end
# .opt
# resource :profile, only: [:show, :edit, :update]
end
