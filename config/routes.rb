Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # 病院オーナー用
  devise_for :owners, skip: [:passwords], controllers: {
    registrations: 'owner/registrations',
    sessions: 'owner/sessions'
  }

  # エンドユーザー用
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  # ゲスト用
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end

  namespace :admin do
    resources :hospitals, only: %i[index new create show edit update destroy] do
      resources :owners, only: %i[index create destroy]
    end
    resources :clinical_departments, only: %i[index create destroy]
    resources :end_users, only: %i[index show edit update] do
      get 'end_users/unsubscribe' => 'end_users#unsubscribe'
      patch 'end_users/withdrawal' => 'end_users#withdrawal'
    end
  end

  namespace :owner do
    resources :owners, only: %i[index create destroy]
    resources :hospitals, only: %i[show edit update]
    resources :reservations, only: %i[index show update]
  end

  namespace :public do
    resources :hospitals, only: %i[index show] do
      resources :reservations, only: [:create]
      get 'reservations/conmplete' => 'reservations#complete'
    end
    patch 'reservations/:id/cancel' => 'reservations#cancel', as: 'cancel'

    resource :end_users, only: %i[show edit update] do
      collection do
        get :reserved_hospitals
      end
    end
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch 'end_users/withdrawal' => 'end_users#withdrawal'
    resource :favorites, only: %i[index create destroy]
  end
  root to: 'homes#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
