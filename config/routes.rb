Rails.application.routes.draw do
  get 'pages/about'
  root 'pokemons#index'
  resources :pokemons, only: [:index, :show]
  resources :types, only: [:index, :show]
  get 'about', to: 'pages#about'
end
