class Review < ApplicationRecord
  belongs_to :cocktail
  validates :description, uniqueness: true, presence: true
end
