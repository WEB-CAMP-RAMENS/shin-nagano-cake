Rails.application.routes.draw do

   scope module: :public do
   root to: "homes#top"
   get "customers/edit" => "customers#edit"
   get "customers/my_page" => "customers#show"
   patch "customers/my_page" => "customers#update"
   
   
   get "/about" => "homes#about"

   resources :items, only: [:index, :show]


   resources :cart_items, only: [:index, :update, :destroy, :create]
   delete "cart_items/destroy_all" => "cart_items#destroy_all"

  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
   resources :items
   resources :genres
   resources :customers
   resources :orders
   resources :order_details
 end


  scope module: :public do
   resource :customers,only:[:edit,:update]
   get "orders/confirm" => "orders#confirm"
   post "orders/confirm" => "orders#confirm"
   get "orders/complete" => "orders#complete"
   resources :orders,only:[:show,:create,:index,:new]
   resources :addresses,except:[:new,:show]
   get "customers/unsubscribe" => "customers#unsubscribe"
   patch "customers/withdraw" => "customers#withdraw"
  end

end
