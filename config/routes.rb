Rails.application.routes.draw do
  # Root Route
  root to: 'home#index'

  # Devise Routes
  devise_for :users

  # User Routes
  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'

      resources :projects do

        get '/collaborators', to: "projects#new_collaborators"
        post '/collaborators', to: "projects#add_collaborators"

        get '/collaborator/:id', to: "projects#show_collaborator", as: "show_collaborator"

        resources :boards do
          resources :stories
        end

      end

    end
  end

  mount ActionCable.server, at: '/cable'

end