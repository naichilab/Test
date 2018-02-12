Rails.application.routes.draw do
    devise_for :users, :controllers => {
	  :sessions      => "users/sessions",
	  :registrations => "users/registrations",
	  :passwords     => "users/passwords",
	  :omniauth_callbacks => "users/omniauth_callbacks"
	}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'events/new'
  get 'top' => 'root#top'
  post 'events' => 'events#create'
  get 'events/:id' => 'events#show', as: 'event'
  get 'events' => 'events#index'
  get 'events/:id/edit' => 'events#edit', as: 'edit_event'
  patch 'events/:id' => 'events#update', as: 'update_event'
  delete 'events/:id' => 'events#destroy', as: 'destroy_event'

  get '/auth/:provider/callback' => 'sessions#create'
end