class PokemonsController < ApplicationController
  def index
    if params[:search].present?
      search_term = "#{params[:search].downcase}%"
      @pokemons = Pokemon.where('LOWER(species) LIKE ?', search_term)
    elsif params[:type].present?
      @type = Type.find_by(name: params[:type])
      @pokemons = @type.pokemons
    else
      @pokemons = Pokemon.all
    end
    @types = Type.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end

