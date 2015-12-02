Rails.application.routes.draw do
  root 'impact#index'

  resources :impact, controller: 'impact'
  resources :zoning, controller: 'zoning'
  resources :safety, controller: 'safety'

  localized do
    resources :learning_center, only: :index
    resources :appointments, only: [:index, :create]
    devise_for :admins, controllers: { sessions: 'admins/sessions' }

    namespace :admins do
      resources :panel, only: :index
      resources :resources
    end
  end
end
