class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :cantidad_de_puntos
      t.integer :precio_de_compra
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
