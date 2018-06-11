Rails.application.routes.draw do
  devise_for :administrators
  root 'home#index'

  namespace :admin do
    resources :construction_records
    resources :vehicles
  end
  resources :construction_records, only: :index, path: 'construction_records/:year'
  resources :vehicles, only: :index
end
