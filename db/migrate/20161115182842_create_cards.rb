class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :numero
      t.integer :anio_vencimiento
      t.integer :mes_vencimiento
      t.string :nombre_prop
      t.string :apellido_prop
      t.string :dni_titular
      t.string :cod_seguridad
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
