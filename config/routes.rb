Rails.application.routes.draw do
  devise_for :passengers, controllers: {
    registrations: 'passengers/registrations'
  }
  devise_scope :passenger do
    post '/passengers/confirm_otp/:id', to: 'passengers/registrations#confirm_otp', as: :confirm_otp1

    get '/passengers/confirm_otp/:id', to: 'passengers/registrations#confirm_otp', as: :confirm_otp
    post '/passengers/verify_otp/:id', to: 'passengers/registrations#verify_otp', as: :verify_otp
    delete '/passengers/sign_out_custom', to: 'devise/sessions#destroy', as: :destroy_passenger_session_custom

  end
  resources :vehicles
  resources :passengers
  resources :rides
  resources :drivers
  root "rides#index"
end
