Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "account_activations/:id/edit", to: "account_activations#edit", as: "edit_account_activation"
      resources :auth_token, only: [:create] do
        post :refresh, on: :collection
        delete :destroy, on: :collection
      end
      get "healthcheck", to: "healthcheck#index"
      resources :categories, only: %i[index show]
      resources :users, only: %i[show create]
      resources :events, only: %i[index show] do
        resources :event_images, only: [:index]
        resources :comments, only: [:index]
        resources :categories_events, only: %i[create destroy]
      end
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
