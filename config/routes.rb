Rails.application.routes.draw do
  # Root Route
  root to: 'home#index'

  # Guest Routes
  get 'home/register'
  get 'home/login'

end
