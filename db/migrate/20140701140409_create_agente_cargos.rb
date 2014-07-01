class CreateAgenteCargos < ActiveRecord::Migration
  def change
    create_table :agente_cargos do |t|
      t.integer :agente_id
      t.integer :cargo_id
      t.string :descripcion
      t.integer :establecimiento_id
      t.string :estado
      t.date :fecha_creacion
      t.integer :cant_horas
      t.string :secuencia

      t.timestamps
    end
  end
end
