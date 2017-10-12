Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :listings
resources :homepage
resources :listings
resources :about_me, only: [:index]
resources :reviews do
  member do
    post 'upvote'
    post 'downvote'
  end
end
resources :searches

resources :users, only: [:index]


put 'admin/:id' => 'users#make_admin', :as => "make_admin"



root to: 'listings#index'
end
