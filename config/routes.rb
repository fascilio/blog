Rails.application.routes.draw do
  resources :articles
  get '/users', to: 'users#index'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show'
  post '/profiles', to: 'profiles#create'
  patch '/profiles/:id', to: 'profiles#update'
  delete '/profiles/:id', to: 'profiles#destroy'

end
