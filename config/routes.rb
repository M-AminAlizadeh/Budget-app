Rails.application.routes.draw do
  devise_for :users

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
