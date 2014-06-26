class CreateConceptos < ActiveRecord::Migration
  def change
    create_table :conceptos do |t|
      t.string :codigo
      t.string :nombre
      t.string :calculo_cargos
      t.string :calculo_horas_media
      t.string :calculo_horas_superior
      t.string :requerido
      t.string :carga_manual
      t.string :ayuda
      t.string :activado_x_defecto
      t.string :tipo
      t.string :tipo_liquidacion

      t.timestamps
    end
  end
end
