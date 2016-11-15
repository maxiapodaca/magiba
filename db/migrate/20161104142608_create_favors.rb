class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :descripcion
      t.string :localidad
      t.string :imagen, default: "http://fotos.subefotos.com/13534e7f5bc5c0ee7147a0a0b782afc7o.png"
      t.string :fecha_caducidad
      t.string :id_ganador

      t.timestamps null: false
    end
  end
end
