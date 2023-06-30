Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'admin/pages#dashboard'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'api/v1/auth/sessions',
        registrations: 'api/v1/auth/registrations'
      }
      resources :strips, only: [] do
        post 'validate', on: :collection
      end
      resources :tests, only: [:create]
    end
  end

  namespace :admin do
    resources :tests, only: [:index]
    resources :strip_batches, only: [:create, :index, :new] do
      resources :strips, only: [:index]
    end
    resources :hormones, only: [:create, :index, :new]
  end
end
