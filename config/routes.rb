Rails.application.routes.draw do
  resources :stops
  resources :transfers
  resources :shapes
  resources :routes
  resources :trips
  resources :stop_times
  resources :calendars
  resources :calendar_dates
  resources :agencies
  root 'landing#index'
  get 'graph', to: 'graphexport#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
