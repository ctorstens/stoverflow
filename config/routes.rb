Stoverflow::Application.routes.draw do
  
  match '/' => 'questions#index'
  match '/login' => 'logins#new'
  match '/logout' => 'logins#delete'


  resources :users,  :only => [:new, :create, :show]
  resources :logins, :only => [:create]
  resources :questions
  resources :answers

end
