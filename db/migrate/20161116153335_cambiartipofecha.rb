class Cambiartipofecha < ActiveRecord::Migration
  def change
  	remove_column :postulations, :fecha 
  	add_column :postulations, :fecha, :date
  end
end
