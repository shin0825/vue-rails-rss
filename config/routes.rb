Rails.application.routes.draw do
  root to: 'homes#index'
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get    'sign_in', to: 'sessions#new'
  get    'me', to: 'sessions#show'
  post   'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :employees, only: [:index, :show]
      get 'links/:year/:month', to: 'links#index', as: 'links/index'
      resources :links, only: [:index, :show, :create]
    end
  end
end
