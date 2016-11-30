class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :favor_id
      t.string :detalle

      t.timestamps null: false
    end
  end
end
