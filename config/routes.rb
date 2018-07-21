Rails.application.routes.draw do
  root 'welcome#home'
  get 'digitize', to: 'documents#new'
  get 'dashboard', to: 'documents#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
