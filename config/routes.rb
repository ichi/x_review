Rails.application.routes.draw do
  devise_for :users, module: 'users'

  root 'root#index'
end
