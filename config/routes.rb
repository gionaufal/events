Rails.application.routes.draw do
  root 'home#index'
  resources :events, only:[:new, :create, :show]
end
