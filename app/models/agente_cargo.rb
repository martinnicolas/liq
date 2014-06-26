class AgenteCargo < ActiveRecord::Base
  attr_accessible :agente_id, :cargo_id, :descripcion, :establecimiento_id, :estado, :fecha

  def nombre_completo
    Agente.find(self.agente_id).apellido_y_nombre + ' - ' + Cargo.find(self.cargo_id).nombre_completo + ' - '+ Establecimiento.find(self.establecimiento_id).nombre_completo
  end
end
