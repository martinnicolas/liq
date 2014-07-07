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
  	["CARGO (DOCENTE)","HORAS","CARGO (AUXILIAR)"]
  end

  def self.tipos_horas
    ["HORAS DE MEDIA","HORAS DE SUPERIOR"]
  end
end
