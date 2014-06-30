class Escuela < ActiveRecord::Base
  attr_accessible :cue, :direccion, :localidad_id, :nombre, :numero

  has_one :Localidad

  def nombre_completo
    'ESCUELA N ' + self.numero.to_s + ' - ' + self.nombre
  end
end
