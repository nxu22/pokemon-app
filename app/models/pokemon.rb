# app/models/pokemon.rb
class Pokemon < ApplicationRecord
    has_many :pokemon_types
    has_many :types, through: :pokemon_types
  
  
   # Validations
   validates :name, presence: true, uniqueness: true
   validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
 end