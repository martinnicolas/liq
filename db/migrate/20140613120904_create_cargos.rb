class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :categoria
      t.string :tipo_cargo
      t.string :nivel
      t.string :descripcion
      t.float :puntos
      t.float :indice
      t.float :hscargo
      t.string :doble
      t.string :hbase
      t.float :testigo
      t.float :basico
      t.string :hstexto

      t.timestamps
    end
  end
end
