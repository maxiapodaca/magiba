class Agregarrecordaratarjeta < ActiveRecord::Migration
   def change
  	add_column :cards, :recordar, :boolean, default: false
  end
end

