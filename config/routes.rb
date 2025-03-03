Rails.application.routes.draw do
  get "lessons/index"
  get "lessons/show"
  # Root route (default to login page)
 # Login routes
 get '/login', to: 'sessions#new', as: 'login'
 post '/login', to: 'sessions#create'
 get "/logout", to: "sessions#destroy", as: '/logout'

 # Sign up route
 get '/signup', to: 'users#new', as: 'signup'

 # Other routes (home page, etc.)
 get '/home', to: 'home#index', as: 'home'

 # LessonS routes
 get "/lessons/:id", to: "lessons#show", as: "lesson"
 resources :lessons, only: [:index, :show]

 root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
<<<<<<< HEAD
 end
=======
  root 'home#index'
end
>>>>>>> c87cf15 (The home page is set to something we can pull up)
