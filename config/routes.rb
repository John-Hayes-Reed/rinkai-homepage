Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :administrators
  root 'home#index'

  resources :vehicles, only: [:index]
  resources :construction_records, only: [:index], path: 'construction_records/:year'

  namespace :admin do
    resources :vehicles
    resources :construction_records
  end
end
