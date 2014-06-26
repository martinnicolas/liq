class CreateLiquidacions < ActiveRecord::Migration
  def change
    create_table :liquidacions do |t|
      t.date :fecha
      t.string :tipo_liquidacion
      t.integer :dias_trabajados
      t.integer :agente_cargo_id

      t.timestamps
    end
  end
end
