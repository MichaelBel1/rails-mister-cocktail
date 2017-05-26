class Cocktail < ApplicationRecord
  has_many :doses
  has_many :reviews
  has_many :ingredients, through: :doses, dependent: :destroy
  has_attachment :photo
  validates :name, uniqueness: true, presence: true
end
