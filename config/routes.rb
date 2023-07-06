Rails.application.routes.draw do
  resources :authors
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'users#login'
  post '/login', to: 'users#authenticate'
  get '/logout', to: 'users#logout'
  

end
