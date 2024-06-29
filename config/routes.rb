Rails.application.routes.draw do
  get 'pages/about'
  root 'pokemons#index'
  
  get 'pokemons/instructions', to: 'pokemons#instructions', as: 'pokemon_instructions'
  resources :pokemons, only: [:index, :show]
  resources :types, only: [:index, :show]
  
  get 'about', to: 'pages#about'
  get 'pokemons/type/:type', to: 'pokemons#index', as: 'type_pokemons'
end
