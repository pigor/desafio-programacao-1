Rails.application.routes.draw do
  resources :purchases

  root to: 'purchases#new'
end
