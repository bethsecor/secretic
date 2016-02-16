Rails.application.routes.draw do
  get  '/dashboard', to: 'dashboard#show'
  root 'home#show'

  # thanks to omniauth-github gem
  get '/auth/:provider/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
