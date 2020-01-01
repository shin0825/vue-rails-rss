Rails.application.routes.draw do
  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :employees, only: [:index, :show]
      get 'links/:year/:month', to: 'links#index', as: 'links/index'
      resources :links, only: [:index, :show, :create]
    end
  end
end
