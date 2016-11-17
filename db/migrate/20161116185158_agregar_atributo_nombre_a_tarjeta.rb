class AgregarAtributoNombreATarjeta < ActiveRecord::Migration
  	def change
  	add_column :cards, :nombre, :string
  end
end
