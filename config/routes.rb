Rails.application.routes.draw do
  # Root Route
  root to: 'home#index'

  # Devise Routes
  devise_for :users

  # User Routes
  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'

      resources :projects
      #get '/projects', to: 'projects#index'
      #get '/projects/new', to: 'projects#new'
      #get '/projects/edit', to: 'projects#edit'
      #get 'projects/create'
    end
  end
end
