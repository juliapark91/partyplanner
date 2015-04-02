Rails.application.routes.draw do
  resources :guests

  resources :parties

  root to: 'parties#index'
end
