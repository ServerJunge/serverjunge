Serverjunge::Application.routes.draw do


  devise_for :users
  	as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
 	get 'tags/:tag', to: 'articles#index', as: :tag
  resources :articles

  root 'articles#index'
end
