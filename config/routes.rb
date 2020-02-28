Rails.application.routes.draw do
  root to: 'homes#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      get       'links/:year/:month', to: 'links#index', as: 'links/index'
      resources :links, only: [:index, :show, :create, :destroy]
      post   'sign_up', to: 'users#create'
      get    'sign_in', to: 'sessions#new'
      get    'me', to: 'sessions#show'
      post   'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
    end
  end
end
