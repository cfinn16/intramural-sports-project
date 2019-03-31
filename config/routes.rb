Rails.application.routes.draw do
  resources :cities, only: [:index, :show]
  resources :leagues, except: [:index, :destroy]
  delete "/leagues/:id", to: "leagues#destroy", as: "destroy"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

  post '/teams/:id/add_to_teams', to: 'teams#add_to_teams', as: "add_to_teams"

  get "/cities/:id/new", to: "leagues#new_in_city", as: "new_in_city"

  get "/leagues/:id/new", to: "teams#join_league", as: "join_league"

  post "/teams/:id/", to: "teams#join_league_create"

  post "/teams/:id/payment", to: "teams#payment", as: "payment"

  resources :teams, only: [:new, :create, :show]

  get "/popular/:id", to: "cities#popular", as: "most_popular"

  get "/players/current", to: "players#current_player", as: "current_player"

  resources :players, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
