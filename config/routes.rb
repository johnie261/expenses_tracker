Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :expenses
  end
  
  root "home#index"
end
