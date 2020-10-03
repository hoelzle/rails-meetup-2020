Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: %i[show index]
end
