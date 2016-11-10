class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, :uniqueness => { :scope => :ingredient_id }
  validates :description, presence: true

end
