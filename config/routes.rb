Rails.application.routes.draw do
  root 'home#index'
  resources :events, only:[:new, :create, :show, :edit, :update, :destroy]
  get "/tag/", to: 'home#tag', as: 'tag'
end
