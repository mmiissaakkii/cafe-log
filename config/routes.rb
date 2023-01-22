Rails.application.routes.draw do
  namespace :public do
    get "comments/create"
    get "comments/destroy"
  end
  root to: "public/homes#top"

  get "maps/index"
  resources :maps, only: [:index]

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  #管理者側ルーティング
  namespace :admin do
    resources :reviews, only:[:index, :show, :edit, :update, :destroy]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :tags, only:[:new, :create]
    get "homes/top"
    get "search_tag" => "reviews#search_tag"
    get "search" => "searches#search"
  end

  #会員側ルーティング
  scope module: :public do
    get "search_tag" => "reviews#search_tag"
    get "search" => "searches#search"
    resources :reviews do
      resource :favorites, only: [:create, :destroy]
      resources :comments,only:[:create,:destroy]
    end
    resources :customers, only:[:index, :show, :edit, :update, :new] do
      member do
        get :favorite
      end
    end
    resources :tags, only:[:show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
