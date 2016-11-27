Rails.application.routes.draw do
  root 'home#index'
  resources :events do
    collection do
      post :import
    end
  end
  get "/tag/", to: 'home#tag', as: 'tag'
end
