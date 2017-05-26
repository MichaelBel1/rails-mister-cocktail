class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    # we need @cocktail in our `simple_form_for`
    @review = Review.new

  end

  def create
    @review = Review.new(reviews_params)
    # we need `cocktail_id` to asssociate reviews with corresponding cocktail
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def reviews_params
    params.require(:review).permit(:description, :rating)
  end
end
