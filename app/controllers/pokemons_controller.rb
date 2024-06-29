class PokemonsController < ApplicationController
  def index
    @types = Type.all

    if params[:type].present? && params[:type] != 'All'
      @type = Type.find_by(name: params[:type])
      @pokemons = @type.pokemons
    else
      @pokemons = Pokemon.all
    end

    if params[:search].present?
      search_term = "#{params[:search].downcase}%"
      @pokemons = @pokemons.where('LOWER(species) LIKE ?', search_term)
    end

    if params[:sort].present?
      sort_order = params[:sort] == 'asc' ? 'ASC' : 'DESC'
      @pokemons = @pokemons.order("species COLLATE NOCASE #{sort_order}")
    end

    # Add pagination
    @pokemons = @pokemons.page(params[:page]).per(9)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
