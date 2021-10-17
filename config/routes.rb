Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  namespace :admin do
   resources :items
   resources :genres
   resources :customers
   resources :orders
   resources :order_details
 end

end