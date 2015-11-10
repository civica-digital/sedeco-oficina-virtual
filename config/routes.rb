Rails.application.routes.draw do
  root 'impact#index'

  resources :impact, controller: 'impact'
  resources :zoning, controller: 'zoning'
  resources :safety, controller: 'safety'

  localized do
    resources :appointments
  end
end
