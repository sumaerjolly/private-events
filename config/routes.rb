Rails.application.routes.draw do
  root "events#index"
  resources :users, only: [:new, :create, :show]
  resources :events,  only: [:index, :new, :create, :show]
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
