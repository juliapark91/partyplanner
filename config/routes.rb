Rails.application.routes.draw do
  resources :guests

  resources :parties

  resources :parties do
    resources :guests
  end

  root to: 'parties#index'
end
