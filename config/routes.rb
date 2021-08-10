Rails.application.routes.draw do
  resources :events
  root "posts#index"
end
