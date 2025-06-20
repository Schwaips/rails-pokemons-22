class PokeballsController < ApplicationController

  def create
    # on recoit tous les paramètres de la Pokeball grâce au formulaire 
    # sur la show Pokémons.
    @pokemon = Pokemon.find(params[:pokemon_id])
    @trainer = Trainer.find(params[:trainer_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    @pokeball.trainer = @trainer

    if pokeball_caught?
      return redirect_to pokemon_path(@pokemon), alert: "Pokeball not caught, try again!"
    end

    if @pokeball.save
      redirect_to pokemon_path(@pokemon), notice: "Pokeball successfully created!"
    else
      redirect_to pokemon_path(@pokemon), alert: "Failed to create Pokeball."
    end
  end

  private

  def pokeball_caught?
    # This method is not used in the current implementation, but can be used
    # to define the logic for whether a Pokeball catches a Pokémon.
    # For now, we randomly decide if the Pokeball catches the Pokémon.
    rand(0..1) == 1
  end

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :caught_on, :location)
  end
end
