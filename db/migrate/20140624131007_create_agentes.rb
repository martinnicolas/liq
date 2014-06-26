class CreateAgentes < ActiveRecord::Migration
  def change
    create_table :agentes do |t|
      t.integer :dni
      t.string :apellido
      t.string :nombre
      t.string :cuit_cuil
      t.date :fecha_ingreso
      t.integer :localidad_id

      t.timestamps
    end
  end
end
