Rails.application.routes.draw do
  resources :users do
    resources :articles
    resources :anals
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end