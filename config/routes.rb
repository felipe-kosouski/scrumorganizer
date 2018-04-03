Rails.application.routes.draw do
  get 'dashboard/index'

  # Root Route
  root to: 'home#index'

  # Devise Routes
  devise_for :users

  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'
    end
  end

end
