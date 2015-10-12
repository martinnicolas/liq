class Agente < ActiveRecord::Base
  attr_accessible :apellido, :cuit_cuil, :dni, :fecha_ingreso, :localidad_id, :nombre

  has_one :localidad

  def apellido_y_nombre
    self.apellido + ', ' + self.nombre
  end

  def porcentaje_antiguedad
  	time_diff_components = Time.diff(Time.new, Time.parse(self.fecha_ingreso.to_s))
  	anios_antiguedad = time_diff_components[:year]
  	if anios_antiguedad > 10 && anios_antiguedad < 20
  		return 20
  	elsif anios_antiguedad > 20 && anios_antiguedad < 30
  		return 30
  	elsif anios_antiguedad > 30
  		return 40
  	end
  end
end
