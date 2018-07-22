Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  authenticated :user do
    root 'welcome#home', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end

  root 'welcome#home'

  resources :documents
  get 'digitize', to: 'documents#new'
  get 'dashboard', to: 'documents#index'
  resources :buckets

end
