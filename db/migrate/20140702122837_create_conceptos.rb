class CreateConceptos < ActiveRecord::Migration
  def change
    create_table :conceptos do |t|
      t.integer :anhomes
      t.integer :codigo_concepto
      t.string :nombre
      t.string :calculo_auxiliares
      t.string :calculo_cargos
      t.string :calculo_horas_media
      t.string :calculo_horas_superior
      t.integer :orden
      t.string :requerido
      t.string :carga_manual
      t.float :minimo
      t.float :maximo
      t.string :ayuda
      t.string :activado_x_defecto
      t.string :tipo

      t.timestamps
    end
  end
end
