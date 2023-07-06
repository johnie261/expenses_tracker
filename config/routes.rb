Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
  
  root "home#index"
end
