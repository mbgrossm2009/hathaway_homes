Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :listings

resources :listings

resources :users, only: [:index]
put 'admin/:id' => 'users#make_admin', :as => "make_admin"
root to: 'listings#index'
end
