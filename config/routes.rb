Rails.application.routes.draw do
  root 'landing#index'

  resources :impact, controller: 'impact'
  resources :zoning, controller: 'zoning'
  resources :safety, controller: 'safety'
  resources :diagnostic, controller: 'diagnostics'do
      collection do
        get 'download_diagnostic', :path => "descargar_diagnostico"
      end
  end

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
