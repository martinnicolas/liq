class CreateAgenteCargos < ActiveRecord::Migration
  def change
    create_table :agente_cargos do |t|
      t.date :fecha
      t.string :estado
      t.string :descripcion
      t.integer :agente_id
      t.integer :cargo_id
      t.integer :establecimiento_id

      t.timestamps
    end
  end
end
