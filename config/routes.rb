Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homes#show'
  resources :books do
    put :return, on: :member
    put :borrow, on: :member
  end

  namespace :admin do
    resources :books
  end
end
