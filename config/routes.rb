Stoverflow::Application.routes.draw do

  match '/' => 'questions#index'
  match '/login' => 'logins#new' 
  match '/logout' => 'logins#delete'
  match '/signup' => 'users#new'

  resources :users,  :only => [:new, :create, :show]
  resources :logins, :only => [:new, :create]
  resources :questions
  resources :answers




end
