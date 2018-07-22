Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

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
