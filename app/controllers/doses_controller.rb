class DosesController < ApplicationController
  before_action :set_cocktail
  def new
    # we need @cocktail in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = doses.new

  end

  def create
    @doses = doses.new(doses_params)
    # we need `cocktail_id` to asssociate doses with corresponding cocktail
    @doses.cocktail = @cocktail

    if @doses.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:doses).permit(:content, :rating)
  end
end
