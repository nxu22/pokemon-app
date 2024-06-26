# app/controllers/pokemons_controller.rb
class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @types = Type.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
