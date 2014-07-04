class Liquidacion < ActiveRecord::Base
  attr_accessible :agente_cargo_id, :dias_trabajados, :fecha, :tipo_liquidacion

  has_many :concepto_liquidacions
  has_many :conceptos, :through => :concepto_liquidacions

  def self.tipos
  	["COMPLEMENTARIA","PROGRAMATICA"]
  end
end
