Myapp::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  #resources :users


get 'apis/put' => 'apis#put', :as => :put_api

# default action of post is create!
resource :mailchimp, :only => [:create]
#Set the user resource to be a profile link outside of admin
get 'profile', to: 'users#show'

#set routes for a namespace under admin
namespace :admin do
  get '', to: 'dashboard#index', as: '/'
  resources :users
  resources :git_updates
  get 'configuration', to: 'configuration#index'    
  # routes under configuration
  get 'configuration/mmofish', to: 'configuration/mmofish#index' 
end

#Routes for contact form
match 'contact' => 'contact#new', :as => 'contact', :via => :get
match 'contact' => 'contact#create', :as => 'contact', :via => :post
end