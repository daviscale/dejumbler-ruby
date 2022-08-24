Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :words, only: [:index]

  # Defines the root path route ("/")
  root "words#index"
end
