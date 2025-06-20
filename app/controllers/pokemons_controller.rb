class PokemonsController < ApplicationController

  def index
    if params[:query].present?
      @pokemons = Pokemon.where('name ILIKE ?', "%#{params[:query]}%")
    else 
      @pokemons = Pokemon.all # => Array of Pokemon instances
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id]) # => UNE instance de pokemon.
    @pokeball = Pokeball.new # => Une instance de Pokeball vide.
  end
end
