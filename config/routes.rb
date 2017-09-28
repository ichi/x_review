Rails.application.routes.draw do
  devise_for :users, module: 'users'
  devise_scope :user do
    scope module: 'users' do
      get 'sign_in', to: 'sessions#new'
      delete 'sign_out', to: 'sessions#destroy'
    end

    resources :authentications, module: :my, path: '/users/auth', param: :provider, as: :my_authentications, only: %i(destroy)
  end

  namespace :my do
    resource :profile, only: %i(show edit update destroy)
  end

  root 'root#index'
end
