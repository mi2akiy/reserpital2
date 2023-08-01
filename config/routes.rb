Rails.application.routes.draw do
  namespace :admin do
    get 'clinical_department_managers/index'
  end
  #管理者用
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #病院オーナー用
  devise_for :owners, skip:[:registrations, :passwords], controllers: {
    sessions: "owner/sessions"
  }

  #エンドユーザー用
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :hospitals, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :clinical_departments, only: [:index, :create, :destroy]
    resources :end_users, only: [:index, :show,:edit, :update]
  end

  namespace :owner do
    get 'homes/top' => 'homes#top'
    resources :end_users, only: [:show]
    resources :reserves, only: [:edit, :update]
  end

  namespace :public do
    resources :hospitals, only: [:index, :show] do
      resources :reservations, only: [:create,]
      get 'reservationss/conmplete' => 'reservations#complete'
    end
    
    resource :end_users, only: [:show, :edit, :update]  do 
      collection do 
       get :reserved_hospitals
      end
    end
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch 'end_users/withdrawal' => 'end_users#withdrawal'
    resource :favorites, only: [:index, :create, :destroy]
  end
  root to: 'public/homes#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
