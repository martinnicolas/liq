class LiquidacionsController < ApplicationController
  # GET /liquidacions
  # GET /liquidacions.json
  def index
    @liquidacions = Liquidacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @liquidacions }
    end
  end

  # GET /liquidacions/1
  # GET /liquidacions/1.json
  def show
    @liquidacion = Liquidacion.find(params[:id])

    #Obtengo todos los conceptos de la liquidacion
    @concepto_liquidacion = ConceptoLiquidacion.select("*")
    .joins('LEFT JOIN liquidacions ON liquidacions.id = concepto_liquidacions.liquidacion_id')
    .joins('RIGHT JOIN conceptos ON conceptos.id = concepto_liquidacions.concepto_id')
    .where(:liquidacion_id => @liquidacion.id)
    .order('conceptos.codigo_concepto')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @liquidacion }
    end
  end

  # GET /liquidacions/new
  # GET /liquidacions/new.json
  def new
    @liquidacion = Liquidacion.new

    #Levanto de conceptos, todos los conceptos que son requeridos para liquidacion de auxiliares    
    @conceptos = Concepto.where(:anhomes => 201407).order(:codigo_concepto)    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @liquidacion }
    end
  end

  # GET /liquidacions/1/edit
  def edit
    
    #Levanto de conceptos, todos los conceptos que son requeridos para liquidacion de auxiliares    
    @conceptos = Concepto.where(:anhomes => 201407).order(:codigo_concepto)    

    #Levanto todos los conceptos incluidos en la liquidacion que se va a editar
    @liquidacion = Liquidacion.find(params[:id])
    @conceptos_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => @liquidacion.id).pluck(:concepto_id)
  end

  # POST /liquidacions
  # POST /liquidacions.json
  def create
    @liquidacion = Liquidacion.new(params[:liquidacion])

    respond_to do |format|
      if @liquidacion.save

        calcular_conceptos(@liquidacion)
        
        format.html { redirect_to @liquidacion, notice: 'Se ha creado una nueva liquidacion' }
        format.json { render json: @liquidacion, status: :created, location: @liquidacion }
      else
        format.html { render action: "new" }
        format.json { render json: @liquidacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /liquidacions/1
  # PUT /liquidacions/1.json
  def update    
    @liquidacion = Liquidacion.find(params[:id])    
    @liquidacion.update_attributes(params[:liquidacion])    

    #Elimino todos los conceptos incluidos en la liquidacion
    @conceptos_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => @liquidacion.id)
    @conceptos_liquidacion.each do |concepto|
      concepto.destroy
    end

    calcular_conceptos(@liquidacion)

    respond_to do |format|
      if @liquidacion.update_attributes(params[:liquidacion])
        format.html { redirect_to @liquidacion, notice: 'Liquidacion actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @liquidacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidacions/1
  # DELETE /liquidacions/1.json
  def destroy
    @liquidacion = Liquidacion.find(params[:id])

    #Elimino todos los conceptos incluidos en la liquidacion
    @conceptos_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => @liquidacion.id)
    @conceptos_liquidacion.each do |concepto|
      concepto.destroy
    end

    @liquidacion.destroy
    respond_to do |format|
      format.html { redirect_to liquidacions_url }
      format.json { head :no_content }
    end
  end

  def calcular_conceptos liquidacion
    agente_cargo = AgenteCargo.find(liquidacion.agente_cargo_id)
    cargo = Cargo.find(agente_cargo.cargo_id)
    agente = Agente.find(agente_cargo.agente_id)
    establecimiento = Establecimiento.find(agente_cargo.establecimiento_id)

    #Almaceno en memoria calculo del basico
    calc = Dentaku::Calculator.new
    calc.store(puntos_cargo: cargo.puntos)
    calc.store(indice_cargo: cargo.indice)
    calc.store(cantidad_horas: agente_cargo.cant_horas)
    calc.store(dias_trabajados: liquidacion.dias_trabajados)
    #Almaceno en memoria calculo del porcentaje de antiguedad
    calc.store(porcentaje_antiguedad: agente_cargo.porcentaje_antiguedad)
    #Almaceno en la zona para el calculo de Zona Patagonica
    calc.store(zona: establecimiento.zona)


    #Levanto los conceptos seleccionados
    @conceptos_seleccionados = params[:codigos][:seleccionados]

    #Creo el objeto ConceptoLiquidacion y almaceno en Hash los conceptos que se deben calcular
    conceptos_no_remunerativos = Hash.new
    conceptos_remunerativos = Hash.new
    @conceptos_seleccionados.each do | concepto_id |
      @concepto_liquidacion = ConceptoLiquidacion.new
      @concepto_liquidacion.liquidacion_id = @liquidacion.id
      @concepto_liquidacion.concepto_id = concepto_id
      @concepto = Concepto.find(concepto_id)
      codigo = "codigo#{@concepto.codigo_concepto}"
      if @concepto.carga_manual == 'NO'        
        case cargo.tipo_cargo
          when 'C'
            if @concepto.tipo == 'REMUNERATIVO'
              conceptos_remunerativos[codigo] = @concepto.calculo_cargos              
            else
              conceptos_no_remunerativos[codigo] = @concepto.calculo_cargos
            end
          when 'H'
            if  cargo.nivel == 'M'
              if @concepto.tipo == 'REMUNERATIVO'
                conceptos_remunerativos[codigo] = @concepto.calculo_horas_media                
              else
                conceptos_no_remunerativos[codigo] = @concepto.calculo_horas_media
              end
            end
            if  cargo.nivel == 'S'  
              if @concepto.tipo == 'REMUNERATIVO'
                conceptos_remunerativos[codigo] = @concepto.calculo_horas_superior
              else
                conceptos_no_remunerativos[codigo] = @concepto.calculo_horas_superior                
              end
            end           
          when 'A'
            if @concepto.tipo == 'REMUNERATIVO'
              conceptos_remunerativos[codigo] = @concepto.calculo_auxiliares              
            else
              conceptos_no_remunerativos[codigo] = @concepto.calculo_auxiliares
            end
        end
        codigo = "codigo#{@concepto.codigo_concepto}"  
        if @concepto.tipo == 'REMUNERATIVO'        
          @concepto_liquidacion.formula_calculo = conceptos_remunerativos[codigo]
          @concepto_liquidacion.calculo = conceptos_remunerativos[codigo]
        else          
          @concepto_liquidacion.formula_calculo = conceptos_no_remunerativos[codigo]
          @concepto_liquidacion.calculo = conceptos_no_remunerativos[codigo]
        end
        @concepto_liquidacion.save
      end    
    end

    #Calculo todos los conceptos involucrados en la liquidacion
    @total_remunerativo = calc.solve!(conceptos_remunerativos)
    total = calcular_total_remunerativo(@total_remunerativo)
    calc.store(total_remunerativo: total)
    @total_no_remunerativo = calc.solve!(conceptos_no_remunerativos)

    #Actualizo valor_calculado de cada concepto
    @conceptos_en_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => liquidacion.id)
    @conceptos_en_liquidacion.each do | concepto_en_liq |
      @concepto = Concepto.find(concepto_en_liq.concepto_id)
      codigo = "codigo#{@concepto.codigo_concepto}"
      @concepto_liquidacion = ConceptoLiquidacion.find(concepto_en_liq.id)
      if @concepto.carga_manual == 'NO'                      
        if @concepto.tipo == 'REMUNERATIVO'
          @concepto_liquidacion.calculo = conceptos_remunerativos[codigo]
          @concepto_liquidacion.valor_calculado = @total_remunerativo[codigo]            
        else 
          if @concepto.tipo == 'DESCUENTO'          
            @total_no_remunerativo[codigo] = @total_no_remunerativo[codigo] * -1 #Si es un descuento debo restar el valor calculado
          end
          @concepto_liquidacion.calculo = conceptos_no_remunerativos[codigo]
          @concepto_liquidacion.valor_calculado = @total_no_remunerativo[codigo]
        end
      end
      @concepto_liquidacion.save
    end
  end

  def calcular_total_remunerativo hash
    p hash.inject(0) { |sum, tuple| sum += tuple[1] }
  end

end



