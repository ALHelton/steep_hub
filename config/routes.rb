Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:show] do
        resources :subscriptions, only: [:index, :create, :update, :show]
      end
    end
  end
end
