Stoverflow::Application.routes.draw do
  
  match '/' => 'questions#index'
  match '/login' => 'logins#new'
  match '/logout' => 'logins#delete'
  match '/signup' => 'users#new'


  resources :users,  :only => [:create, :show]
  resources :logins, :only => [:create]
  resources :questions
  resources :answers

end
