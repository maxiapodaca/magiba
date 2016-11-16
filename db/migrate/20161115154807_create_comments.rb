class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :favor_id
      t.string :detalle

      t.timestamps null: false
    end
  end
end
