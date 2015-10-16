class CreateEstablecimientos < ActiveRecord::Migration
  def change
    create_table :establecimientos do |t|
      t.integer :numero
      t.string :nombre
      t.string :direccion
      t.integer :cue
      t.float :zona
      t.float :ubicacion_cargos
      t.float :ubicacion_horas
      t.integer :localidad_id

      t.timestamps
    end
  end
end
