Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "index", to: "words#index"
  get "dejumble", to: "words#dejumble"

  # Defines the root path route ("/")
  root "words#index"
end
