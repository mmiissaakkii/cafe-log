Rails.application.routes.draw do

  root to: "public/homes#top"

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',

}



# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #管理者側ルーティング
  namespace :admin do
    resources :reviews, only:[:index, :show, :edit, :update, :destroy] do
      resources :comments,only:[:destroy]
    end
    resources :customers, only:[:index, :show, :edit, :update]
    resources :tags, only:[:new, :create]
    get "homes/top"
    get "search_tag" => "reviews#search_tag"
    get "search" => "searches#search"
  end

  #会員側ルーティング
  namespace :public do
    get "comments/create"
    get "comments/destroy"
  end

  scope module: :public do
    post "guest_sign_in" => "customers#guest_sign_in"  #ゲストログイン
    get "search_tag" => "reviews#search_tag"
    get "search" => "searches#search"
    resources :reviews do
      resource :favorites, only: [:create, :destroy]
      resources :comments,only:[:create,:destroy]
    end
    resources :customers, only:[:index, :show, :edit, :update, :new, :destroy] do
      member do
        get :favorite
      end
    end
    resources :tags, only:[:destroy, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
