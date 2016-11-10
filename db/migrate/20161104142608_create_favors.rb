class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :localidad
      t.string :imagen, default: "http://fotos.subefotos.com/c4472a12d1a15e9517d1cd0862cdfd23o.png"
      t.string :fecha_caducidad
      t.string :id_ganador

      t.timestamps null: false
    end
  end
end
