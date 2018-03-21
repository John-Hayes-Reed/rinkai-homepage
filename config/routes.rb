Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :construction_records
    resources :vehicles
  end
  resources :construction_records, only: :index
end
