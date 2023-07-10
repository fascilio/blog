Rails.application.routes.draw do
  resources :articles
  get '/users', to: 'users#index'
  post '/signup', to: 'users#create'
  get '/signin', to: 'users#login'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show'
  post '/profiles', to: 'profiles#create'
  patch '/profiles/:id', to: 'profiles#update'
  delete '/profiles/:id', to: 'profiles#destroy'
  resources :articles, only: [:index, :create, :update, :destroy]
  post '/articles', to: 'articles#create'
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  put '/articles/:id', to: 'articles#update'
  get '/articles/:article_id/comments', to: 'comments#index'
  post '/articles/:id/comments', to: 'articles#update'
  post '/articles/:article_id/comments', to: 'comments#create'
  delete '/articles/:article_id/comments/:comment_id', to: 'comments#destroy'
  post '/articles/:article_id/interaction', to: 'articles#interaction'

end
