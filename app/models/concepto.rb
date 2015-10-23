class Concepto < ActiveRecord::Base
  attr_accessible :activado_x_defecto, :anhomes, :ayuda, :calculo_auxiliares, :calculo_cargos, :calculo_horas_media, :calculo_horas_superior, :carga_manual, :codigo_concepto, :maximo, :minimo, :nombre, :orden, :requerido, :tipo

  has_many :concepto_liquidacions
  has_many :liquidacions, :through => :concepto_liquidacions

  def self.tipos
  	["REMUNERATIVO","NO REMUNERATIVO","PATRONAL","DESCUENTO"]
  end
end
