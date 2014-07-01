class AgenteCargo < ActiveRecord::Base
  attr_accessible :agente_id, :cant_horas, :cargo_id, :descripcion, :establecimiento_id, :estado, :fecha_creacion, :secuencia

  def nombre_completo
  	Agente.find(self.agente_id).apellido_y_nombre + ' - '+ Cargo.find(self.cargo_id).nombre_completo + ' ' + Establecimiento.find(establecimiento_id).nombre_completo + ' - ' +self.cant_horas.to_s
  end
end
