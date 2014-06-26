class Cargo < ActiveRecord::Base
  attr_accessible :basico, :categoria, :descripcion, :doble, :hbase, :hscargo, :hstexto, :indice, :nivel, :puntos, :testigo, :tipo_cargo

  def nombre_completo
    self.categoria + ' - ' + self.descripcion
  end

  def actualizar_indice nuevo_indice
    self.update_attributes(:indice => nuevo_indice, :basico => nuevo_indice.to_f * self.puntos)
  end
end
