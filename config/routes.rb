Rails.application.routes.draw do
　# Rootはライブ一覧ページ
  root to: "events#index"

  # 基礎情報ページの表示
  get '/about', to: 'root#about'
  get '/terms', to: 'root#terms'
  get '/privacy', to: 'root#privacy'

  #Twitterログイン認証
   get 'auth/:provider/callback', to: 'sessions#create'
  #Twitterからログアウト
   get '/logout', to: 'sessions#destroy'

  #ユーザー認証
    devise_for :users, :controllers => {
	  :sessions      => "users/sessions",
	  :registrations => "users/registrations",
	  :passwords     => "users/passwords",
	  :omniauth_callbacks => "users/omniauth_callbacks"
	}

  # ユーザー管理
  resources :users, only: [:show, :edit, :update, :create, :destroy]

  #ライブ投稿
  resources :events, only: [:new, :create, :edit, :index, :show, :destroy] do
	    #参加するボタン
	    resources :participates, only: [:create, :destroy]
	    #検討中ボタン
	    resources :pendings, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end