class AgregarAtributosPostulaciones < ActiveRecord::Migration
  def change
  	remove_column :postulations, :fecha 
  	add_column :postulations, :fecha, :date
  	add_column :postulations, :aceptar , :boolean , default: false
  end
end
