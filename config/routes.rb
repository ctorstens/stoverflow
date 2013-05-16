Stoverflow::Application.routes.draw do

  match '/' => 'questions#index'
  resources :questions
  resources :users, :only => [:new, :create, :show]
 
end
