class AgregarAtributosAFavores < ActiveRecord::Migration
  def change
  	add_column :favors, :visitas, :integer, default: '0'
  	add_column :favors, :user_id, :integer
  	add_column :favors, :comment_id, :integer
  	add_column :favors, :estado, :integer, default: '0'
  end
end

