class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :species
      t.string :sprite
      t.float :height
      t.float :weight
      t.string :abilities

      t.timestamps
    end
  end
end
