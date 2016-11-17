class NuevoCampoCompras < ActiveRecord::Migration
  def change
  	add_column :compras, :card_id, :integer
  end
end
