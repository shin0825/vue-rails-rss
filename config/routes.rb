Rails.application.routes.draw do
  root to: 'homes#index'
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  resources :users, only: [ :create ] do
    collection do
      post 'sign_in'
      delete 'sign_out'
      get 'me' # ← 追加
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :employees, only: [:index, :show]
      get 'links/:year/:month', to: 'links#index', as: 'links/index'
      resources :links, only: [:index, :show, :create]
    end
  end
end
