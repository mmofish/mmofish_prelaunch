Myapp::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users


get 'apis/put' => 'apis#put', :as => :put_api

# default action of post is create!
resource :mailchimp, :only => [:create]

get 'profile', to: 'users#show'

end