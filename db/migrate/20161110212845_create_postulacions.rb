class CreatePostulacions < ActiveRecord::Migration
  def change
    create_table :postulacions do |t|
      t.integer :id_favor
      t.integer :id_userfav
      t.string :fecha
      t.string :descripcion
      t.boolean :es_ganador

      t.timestamps null: false
    end
  end
end
