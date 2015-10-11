class IndexController < ApplicationController
  def index
  	calc = Dentaku::Calculator.new
  	calc.store(puntos_cargo: 10)
  	calc.store(indice_cargo: 30)
  	calc.store(dias_trabajados: 30)

  	need_to_compute = Hash.new
  	need_to_compute['codigo1110'] = '(puntos_cargo * indice_cargo) * dias_trabajados / 30'
  	need_to_compute['codigo1157'] = 'codigo1110 + 300'

  	@resultado = calc.solve!(need_to_compute)

  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resultado }
    end
  end
end
