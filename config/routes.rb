Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # api test action
      resources :hello, only: [:index]
        # ヘルスチェック用のルートを追加
      # get '/healthcheck', to: 'api/v1/healthcheck#index'
      get :healthcheck, to: "healthcheck#index"
    end
  end
end
