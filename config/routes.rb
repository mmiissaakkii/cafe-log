Rails.application.routes.draw do

  root to: 'public/homes#top'


  #管理者側ルーティング
  namespace :admin do
    resources :reviews, only:[:index, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end
  #会員側ルーティング
  namespace :public do
    resources :reviews do
      resources :favorites, only: [:create, :destroy]
      #resources :comments, only: [:create,:destroy]
    resources :customers, only:[:index, :show, :edit, :update, :new]
    end
  end


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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
