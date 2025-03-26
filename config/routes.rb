Rails.application.routes.draw do

  # Home Page
  get '/home', to: 'home#index', as: 'home'
  root 'home#index'

  get "content_pages/show"

  get "lessons/index"
  get "lessons/show"
  # signup route
  get '/signup', to: 'users#new', as: 'signup'
  # Root route (default to login page)
 
  # Login routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get "/logout", to: "sessions#destroy", as: '/logout'


  # Login routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # Signup routes
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  resources :users, only: [:new, :create]

  # Lessons routes with nested content/assessment pages
  resources :lessons, only: [:index, :show] do
    resources :content_pages, only: [:show]
    resources :assessment_pages, only: [:show]
  end

  # Forum Routes
  get 'forum/general_discussion', to: 'forum_posts#index', defaults: { category: 'general' }, as: 'general_discussion'
  get 'forum/help_support', to: 'forum_posts#index', defaults: { category: 'help' }, as: 'help_support'
  get 'forum/off_topic', to: 'forum_posts#index', defaults: { category: 'offtopic' }, as: 'off_topic'

  resources :forum_posts

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA (optional, currently commented out)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

end


  # Defines the root path route ("/")

 end

  root 'home#index'
end



  # Defines the root path route ("/")

 end

  root 'home#index'
end


 end

