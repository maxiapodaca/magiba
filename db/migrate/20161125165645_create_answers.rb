class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :detalle
      t.integer :favor_id
      t.integer :user_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
