class Ingredient < ActiveRecord::Base
  has_many :measures
  has_many :drinks, through: :measures
end
