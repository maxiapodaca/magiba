class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :detalle
      t.string :favor_id
      t.string :user_id
      t.string :comment_id

      t.timestamps null: false
    end
  end
end
