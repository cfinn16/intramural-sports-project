Rails.application.routes.draw do
  resources :cities, only: [:index, :show]
  resources :leagues, except: [:index, :destroy]
  delete "/leagues/:id", to: "leagues#destroy", as: "destroy"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'teams/:id/add_to_teams', to: 'teams#add_to_teams', as: "add_to_teams"

  get "/cities/:id/new", to: "leagues#new_in_city", as: "new_in_city"

  get "/leagues/:id/new", to: "teams#join_league", as: "join_league"

  post "/leagues/:id/", to: "teams#join_league_create"

  post "/teams/:id/payment", to: "teams#payment", as: "payment"

  resources :teams, only: [:new, :create, :show]

  get "/popular/:id", to: "cities#popular", as: "most_popular"


  resources :players, only: [:new, :create, :show]

  # get "/sports", to: "sports#show", as: "eligible_sports"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
