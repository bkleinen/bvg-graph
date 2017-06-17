Rails.application.routes.draw do
  resources :stop_times
  resources :calendars
  resources :calendar_dates
  resources :agencies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
