class AgregarAtributosAUsuario < ActiveRecord::Migration
  def change
  	add_column :users, :puntos, :integer, default: '1'
  	add_column :users, :favor_id, :integer
  	add_column :users, :comment_id, :integer
  end
end
