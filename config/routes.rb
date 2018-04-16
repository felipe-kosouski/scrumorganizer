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
        resources :boards
      end

    end
  end
end
