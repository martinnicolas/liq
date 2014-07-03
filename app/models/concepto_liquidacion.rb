class ConceptoLiquidacion < ActiveRecord::Base
  attr_accessible :calculo, :concepto_id, :formula_calculo, :liquidacion_id, :valor_calculado

  belongs_to :concepto
  belongs_to :liquidacion
  
end
