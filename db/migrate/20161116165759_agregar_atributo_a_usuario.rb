class AgregarAtributoAUsuario < ActiveRecord::Migration
  def change
  	add_column :users, :puntos, :integer, default: '1'
  end
end
