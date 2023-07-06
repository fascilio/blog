Rails.application.routes.draw do
  resources :authors
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'users#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show'
  post '/profiles', to: 'profiles#create'
  patch '/profiles/:id', to: 'profiles#update'
  delete '/profiles/:id', to: 'profiles#destroy'

end
