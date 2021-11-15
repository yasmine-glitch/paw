Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :animals do
    resources :reservations, only: [ :new, :create ]
  end
  get "/dashboard", to: "pages#dashboard"
  get "/reservations", to: "reservations#index"
  get "/reservations/:id", to: "reservations#edit"
  patch "/reservations/:id", to: "reservations#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
