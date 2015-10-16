class AgenteCargo < ActiveRecord::Base
  attr_accessible :agente_id, :cant_horas, :cargo_id, :tipo_cargo, :tipo_horas, :descripcion, :establecimiento_id, :estado, :fecha_creacion, :secuencia

  def nombre
  	Cargo.find(self.cargo_id).nombre_completo
  end

  def nombre_completo
  	Agente.find(self.agente_id).apellido_y_nombre + ' - '+ Cargo.find(self.cargo_id).nombre_completo + ' ' + Establecimiento.find(establecimiento_id).nombre_completo + ' - ' +self.cant_horas.to_s + ' Hs.'
  end

  def self.estados
  	["ALT","BAJ","LIC"]
  end

  def self.tipos_cargos
  	["C","H","A"]
  end

  def self.tipos_horas
    ["M","S", ""]
  end

  def porcentaje_antiguedad
    time_diff_components = Time.diff(Time.new, Time.parse(self.fecha_creacion.to_s))
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
