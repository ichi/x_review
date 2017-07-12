Rails.application.routes.draw do
  devise_for :users, module: 'users'
  devise_scope :user do
    scope module: 'users' do
      delete 'sign_out', to: 'sessions#destroy'
    end
  end

  root 'root#index'
end
