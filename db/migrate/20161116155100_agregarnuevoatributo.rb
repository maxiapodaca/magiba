class Agregarnuevoatributo < ActiveRecord::Migration
  def change
  	add_column :favors, :user_id, :integer 
  end
end
