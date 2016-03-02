Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :parking_locations
    end
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
