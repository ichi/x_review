Rails.application.routes.draw do
  devise_for :users, module: 'users'
  devise_scope :user do
    scope module: 'users' do
      get 'sign_in', to: 'sessions#new'
      delete 'sign_out', to: 'sessions#destroy'
    end
  end

  root 'root#index'
end
