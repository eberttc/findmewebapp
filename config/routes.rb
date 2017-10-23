Rails.application.routes.draw do
  resources :orderdetails
  resources :orders
  resources :products
  #resources :categories
  resources :races
  #resources :comments
  #resources :my_searches
  resources :lost_pets do
      resources :comments
    end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #resources :pets
  resources :pet_types
  #resources :profiles
  resources :districts
 # devise_for :users, :controllers => {:registrations => "registration"}
  get 'home/index'
  
 # resources :users, except: [:new]
  get '/register',to: 'users#new'
  resources :users ,  except: [:new]  do
    resources :pets
    resources :my_searches
    resource :profiles, only: [:show, :update, :edit]
  end
  
  resources :stores do
    resources :categories
  end  
  #get 'users/:id/:profile' , path: "edit_user_profile" , to: 'profiles#profile_exists'
  
  get '/login' ,to: 'logins#new'
  post '/login' ,to: 'logins#create'
  get '/logout' ,to: 'logins#destroy'
  get '/add_lostpet/:id' ,to: 'lost_pets#addLostPet' , as: 'add_lost_pet'
   
  
  
  
  
  root to: "home#index"
end
