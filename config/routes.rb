Rails.application.routes.draw do
  # Root route (default to login page)
  root "sessions#new"
  
  # Login routes
  get "/login", to: "sessions#new"        # Show the login form
  post "/login", to: "sessions#create"     # Handle form submission (create session)
  
  # Logout route
  delete "/logout", to: "sessions#destroy", as: "logout" # Logout (destroy session)
  
  # Home page route (only accessible when logged in)
  get "/home", to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
 end
