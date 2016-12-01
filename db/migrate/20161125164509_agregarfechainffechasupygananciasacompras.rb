class Agregarfechainffechasupygananciasacompras < ActiveRecord::Migration
  def change
  	    add_column :compras, :fecha_inf, :date
  	    add_column :compras, :fecha_sup, :date
  	    add_column :compras, :ganancias, :real
  end
end