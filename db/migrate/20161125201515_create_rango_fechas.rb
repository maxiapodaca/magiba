class CreateRangoFechas < ActiveRecord::Migration
  def change
    create_table :rango_fechas do |t|
      t.date :inf
      t.date :sup

      t.timestamps null: false
    end
  end
end
