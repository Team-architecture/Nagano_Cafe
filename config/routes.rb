Rails.application.routes.draw do

# 会員用
# ↓2023/08/21記入
scope module: :public do
  root to: "homes#top"
  resources :items, only: [:index, :show]
  get "/customers/confirm_withdraw" => "customers#confirm_withdraw"
  get "/customers/mypage" => "customers#show"
  get "/customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  patch "/customers/withdraw" => "customers#withdraw"
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  resources :orders, only: [:index, :show, :create, :new]
  post "orders/confirm" => "orders#confirm"
  get "orders/complete" => "orders#complete"
  resources :destinations, only: [:index, :edit, :create, :update, :destroy]
  get 'homes/about'

end
# ↑2023/08/21記入
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# ↓2023/08/21記入
namespace :admin do
  root to: 'homes#top'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update, :index]
  resources :order_details, only: [:update]
end
# ↑2023/08/21記入

# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
