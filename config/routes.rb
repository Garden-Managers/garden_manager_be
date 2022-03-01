Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/plants/find', to: 'plant_search#index'
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        get '/plants', to: 'user_plants#all'
      end
      resources :plants, only: [:index, :show, :create]
      get '/user', to: 'users#show'
      get '/user/:id/forecast', to: 'forecast#index'

      resources :user_plants, only: [:create, :destroy]
    end
  end
end
