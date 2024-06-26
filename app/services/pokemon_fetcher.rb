# app/services/pokemon_fetcher.rb
require 'httparty'
class PokemonFetcher
  def self.fetch_and_save
    query = <<-GRAPHQL
      {
        getAllPokemon {
          species
          sprite
          gender {
            female
            male
          }
          height
          weight
          types {
            name
          }
          abilities {
            first {
              key
            }
          }
        }
      }
    GRAPHQL

    response = HTTParty.post(
      "https://graphqlpokemon.favware.tech/v8",
      body: { query: query }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
    
    pokemons = response.parsed_response["data"]["getAllPokemon"]

    pokemons.each do |pokemon_data|
      pokemon = Pokemon.find_or_create_by!(
        species: pokemon_data["species"],
        sprite: pokemon_data["sprite"],
        height: pokemon_data["height"],
        weight: pokemon_data["weight"],
        abilities: pokemon_data["abilities"]["first"]["key"]
      )

      pokemon_data["types"].each do |type_data|
        type = Type.find_or_create_by(name: type_data["name"])
        PokemonType.find_or_create_by!(pokemon: pokemon, type: type)
      end
    end
  end
end
