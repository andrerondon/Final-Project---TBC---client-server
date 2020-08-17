Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # /api/v1/products
  # /api/v1/products/:id
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: [:index, :show, :update, :create, :destroy]
    end
  end

  resources :products, only: [:index, :show, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resource :session, only: [:create, :destroy]


  get("/", to: "welcome#root") 

  
end
