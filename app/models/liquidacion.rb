class Liquidacion < ActiveRecord::Base
  attr_accessible :agente_cargo_id, :dias_trabajados, :fecha, :tipo_liquidacion
end
