Rails.application.routes.draw do
  root to: 'lists#index'
  
  resources :lists, only: [:show, :new, :create]
end
