class CreateLogros < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.string :nombre
      t.text :descripcion
      t.boolean :marca
      t.integer :limite_inferior_rango
      t.integer :limite_superior_rango

      t.timestamps null: false
    end
  end
end
