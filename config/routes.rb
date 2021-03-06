Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events

  post "attend_event/", to: "event_attendees#attend", as: :attend_event
  delete "ignore_event/", to: "event_attendees#ignore", as: :ignore_event

  root "events#index"
end
