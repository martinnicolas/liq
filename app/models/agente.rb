class Agente < ActiveRecord::Base
  attr_accessible :apellido, :cuit_cuil, :dni, :fecha_ingreso, :localidad_id, :nombre

  has_one :localidad

  def apellido_y_nombre
    self.apellido + ', ' + self.nombre
  end
  
end



