Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # auth_token
      resources :auth_token, only: [:create] do
        post :refresh, on: :collection
        delete :destroy, on: :collection
      end
      # healthcheck
      get "healthcheck", to: "healthcheck#index"
      resources :categories, only: [:index]
      # users
      resources :users, only: [:show]
      # events
      resources :events, only: [:index, :show] do
        resources :event_images, only: [:index]
        resources :comments, only: [:index]
        resources :categories_events, only: [:create, :destroy]
      end
    end
  end
end
