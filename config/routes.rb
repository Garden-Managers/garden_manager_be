Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy]
      resources :plants, only: [:index, :show, :create]
      get '/user', to: 'users#show'
    end
  end
end
