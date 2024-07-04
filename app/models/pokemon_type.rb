class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type


# Validations
validates :pokemon_id, presence: true
validates :type_id, presence: true
validates :pokemon_id, uniqueness: { scope: :type_id, message: "Pokemon can only have one specific type assigned once" }
end