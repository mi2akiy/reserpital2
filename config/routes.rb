Rails.application.routes.draw do
  #管理者用
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #病院オーナー用
  devise_for :owners, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #エンドユーザー用
  devise_for :end_users,skip: [:passwords], controllers: {
    registrateions: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root 'homes#top'
    resources :hospitals, only: [:index, :new, :create, :show, :edit, :update]
    resources :end_users, only: [:index, :show,:edit, :update]
  end

  namespace :owner do
    root 'homes#top'
    resources :end_users, only: [:show]
    resources :reserves, only: [:edit, :update]
  end

  namespace :public do
    root 'homes#top'
    resources :hospitals, only: [:index, :show]
    resources :reserves, only: [:new, :create, :index, :show]
    post 'reserves/confirm' => 'reserves#confirm'
    get 'reserves/conmplete' => 'reserves#complete'
    resource :end_users, only: [:show, :edit, :update]
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch 'end_users/withdrawal' => 'end_users#withdrawal'
    resource :favorites, only: [:index, :create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
