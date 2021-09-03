Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :class_groups, params: :slug do
        resources :students, only: [:create]
        resources :seating_charts, only: [:create]
      end
      resources :students, only: [:update, :destroy]
      resources :seating_charts, only: [:update, :destroy]
    end
  end

  get '*path', to: 'pages#index', via: :all
end
