class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    dose = Dose.new(dose_params)
    dose.cocktail_id = params[:cocktail_id]
    unless params[:dose][:ingredient].empty?
      ingredient = Ingredient.where(name: "#{params[:dose][:ingredient]}").take
      dose.ingredient_id = ingredient.id
    end
    if dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(@cocktail)
    end
  end
  def destroy
    dose = Dose.find(params[:id])
    cocktail = Cocktail.find(params[:cocktail_id])
    dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
