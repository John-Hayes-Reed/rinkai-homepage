Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :administrators
  root 'home#index'

  resource :company_profile, only: :show
  resources :construction_records, only: [:index], path: 'construction_records/:year'
  resources :historical_records, only: [:index]
  resources :vehicles, only: [:index]

  namespace :admin do
    resource :company_profile, except: [:destroy]
    resources :construction_records
    resources :historical_records
    resources :information_panels, except: :show do
      get 'move_higher', on: :member
      get 'move_lower', on: :member
    end
    resources :vehicles
    namespace :vehicles do
      resources :global_app_informations, only: [:update, :destroy]
    end
  end
end
