Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'

  devise_for :users, controllers: { sessions: 'devise/sessions' }

  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'splash#index', as: :unauthenticated_root
    end
  end

  resources :categories, only: [:new, :create, :index]
  resources :transactions, only: [:new, :create]
end
