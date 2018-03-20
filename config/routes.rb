Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :construction_records
  end
end
