Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :organization, only: [:show] # opt. :edit, :update

  resources :users, only: [:new, :create]


  resources :projects, only: [:show, :new, :create] do # opt. :index, :edit, :update // :destroy
    resources :tests, only: [:show, :new, :create, :edit, :update] # opt. // :destroy
  end
# .opt
# resource :profile, only: [:show, :edit, :update]
end
