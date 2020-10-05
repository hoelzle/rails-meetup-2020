Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: %i[show index]
  resources :decorated_products, only: %i[show index]
end
