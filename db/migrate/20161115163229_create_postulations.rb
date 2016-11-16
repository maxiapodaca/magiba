class CreatePostulations < ActiveRecord::Migration
  def change
    create_table :postulations do |t|
      t.string :fecha
      t.string :descripcion
      t.integer :favor_id
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
