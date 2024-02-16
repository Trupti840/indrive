Rails.application.routes.draw do
  devise_for :passengers, controllers: {
    registrations: 'passengers/registrations',
    sessions: 'passengers/sessions'
  }
  devise_scope :passenger do
    get '/passengers/confirm_otp/:id', to: 'passengers/registrations#confirm_otp', as: :confirm_otp
    post '/passengers/verify_otp/:id', to: 'passengers/registrations#verify_otp', as: :verify_otp
  end
  resources :vehicles
  resources :passengers, only: [:update]
  resources :rides do
    get :locations, on: :collection
  end
  resources :drivers
  root "rides#index"
  get '/rides/locations', to: 'rides#locations'

end
