Rails.application.routes.draw do
  root 'welcome#home'
  resources :documents
  get 'digitize', to: 'documents#new'
  get 'dashboard', to: 'documents#index'
  devise_for :users
  resources :buckets

end
