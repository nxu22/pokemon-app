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

    if params[:sort].present?
      sort_order = params[:sort] == 'asc' ? 'ASC' : 'DESC'
      @pokemons = @pokemons.order("species COLLATE NOCASE #{sort_order}")
    end

    @types = Type.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end

