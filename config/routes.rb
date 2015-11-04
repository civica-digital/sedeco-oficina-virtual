Rails.application.routes.draw do
root 'impact#index'
resources :zoning, controller: 'zoning'
end
