class CambiarnumeroCardaString < ActiveRecord::Migration
  def up
    change_table :cards do |t|
      t.change :numero, :string
    end
  end

  def down
    change_table :cards do |t|
      t.change :numero, :integer
    end
  end
end
