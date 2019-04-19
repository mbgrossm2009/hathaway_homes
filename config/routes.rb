Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :listings
resources :zpids
resources :homepage
resources :listings
resources :mylistings


 resources :reviews do
  member do
    post 'upvote'
    post 'downvote'
  end
end

resources :searches

resources :users, only: [:index]

get 'contact-me', to: 'messages#new', as: 'new_message'
post 'contact-me', to: 'messages#create', as: 'create_message'

put 'admin/:id' => 'users#make_admin', :as => "make_admin"

root 'listings#index'

end
