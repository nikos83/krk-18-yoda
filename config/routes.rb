Rails.application.routes.draw do
  root to: "buckets#index"
  devise_for :users
  resources :buckets
end
