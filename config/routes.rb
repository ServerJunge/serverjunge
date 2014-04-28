Serverjunge::Application.routes.draw do

  devise_for :users

  
 	get 'tags/:tag', to: 'articles#index', as: :tag
  resources :articles

  root 'articles#index'
end
