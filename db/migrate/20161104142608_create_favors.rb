class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :localidad
      t.string :imagen
      t.string :fecha_caducidad
      t.string :id_ganador

      t.timestamps null: false
    end
  end
end
