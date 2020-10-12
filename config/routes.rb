Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index' 
  resources :boards do
    resources :comments, only: :create
    collection do 
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
