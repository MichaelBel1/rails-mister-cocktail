class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    # we need @cocktail in our `simple_form_for`
    @dose = Dose.new

  end

  def create
    @dose = Dose.new(doses_params)
    # we need `cocktail_id` to asssociate doses with corresponding cocktail
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
