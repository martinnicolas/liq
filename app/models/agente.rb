class Agente < ActiveRecord::Base
  attr_accessible :apellido, :cuit_cuil, :dni, :fecha_ingreso, :localidad_id, :nombre

  has_one :localidad

  def apellido_y_nombre
    self.apellido + ', ' + self.nombre
  end

  def porcentaje_antiguedad
  	time_diff_components = Time.diff(Time.new, Time.parse(self.fecha_ingreso.to_s))
  	anios_antiguedad = time_diff_components[:year]
  	if anios_antiguedad >= 0 && anios_antiguedad <= 1
  		return 15
  	elsif anios_antiguedad >= 2 && anios_antiguedad <= 4
  		return 20
  	elsif anios_antiguedad >= 5 && anios_antiguedad <= 6
  		return 30
    elsif anios_antiguedad >= 7 && anios_antiguedad <= 9
      return 40
    elsif anios_antiguedad >= 10 && anios_antiguedad <= 11
      return 50
    elsif anios_antiguedad >= 12 && anios_antiguedad <= 14
      return 60
    elsif anios_antiguedad >= 15 && anios_antiguedad <= 16
      return 70
    elsif anios_antiguedad >= 17 && anios_antiguedad <= 19
      return 80
    elsif anios_antiguedad >= 20 && anios_antiguedad <= 21
      return 100
    elsif anios_antiguedad >= 22 && anios_antiguedad <= 23
      return 110
    elsif anios_antiguedad >= 24
      return 120
  	end
  end
end



