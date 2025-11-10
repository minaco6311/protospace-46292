Rails.application.routes.draw do 
  devise_for :users

  # トップページ（ルートパス）の設定
  root to: 'prototypes#index'

  # prototypesコントローラーのルーティング設定
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end

  # usersコントローラーのルーティング設定（ユーザー詳細ページ）
  resources :users, only: :show

  # Health-check（Rails標準の診断ルート）
  get "up" => "rails/health#show", as: :rails_health_check
end
