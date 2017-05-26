class Addcocktailtoreviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :cocktail, foreign_key: true
  end
end
