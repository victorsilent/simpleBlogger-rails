Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :users

  resources :user_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'


  root 'articles#index'
end
