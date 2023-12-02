Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auth_token, only: [:create] do
        post :refresh, on: :collection
        delete :destroy, on: :collection
      end

      get "healthcheck", to: "healthcheck#index"

      post "s3/sign", to: "s3_signatures#create"

      resources :categories, only: %i[index show]

      resources :users, only: %i[show create] do
        collection do
          delete :destroy
        end
        member do
          patch :update
        end
      end

      resource :user_profiles, only: %i[show update]

      resources :events, only: %i[index show] do
        resources :event_images, only: [:index]
        resources :comments, only: %i[index create]
        resources :categories_events, only: %i[create destroy]
      end

      resources :favourites, only: %i[index create destroy]
    end
  end
  get "account_activations/:id/edit", to: "account_activations#edit", as: "edit_account_activation"
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
