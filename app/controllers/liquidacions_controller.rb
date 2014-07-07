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
    @conceptos = Concepto.where(:anhomes => 201407, :requerido => 'SI').order(:codigo_concepto)    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @liquidacion }
    end
  end

  # GET /liquidacions/1/edit
  def edit
    
    #Levanto de conceptos, todos los conceptos que son requeridos para liquidacion de auxiliares    
    @conceptos = Concepto.where(:anhomes => 201407, :requerido => 'SI').order(:codigo_concepto)    

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

        cargo = Cargo.find(AgenteCargo.find(@liquidacion.agente_cargo_id).cargo_id)
        
        #Levanto los conceptos seleccionados
        @conceptos_seleccionados = params[:codigos][:seleccionados]

        #Creo el objeto ConceptoLiquidacion    
        @conceptos_seleccionados.each do | concepto_id |
          @concepto_liquidacion = ConceptoLiquidacion.new
          @concepto_liquidacion.liquidacion_id = @liquidacion.id
          @concepto_liquidacion.concepto_id = concepto_id
          @concepto_liquidacion.formula_calculo = "formula completa"
          @concepto_liquidacion.calculo = "formula solo con numeros"
          case cargo.tipo_cargo
            when 'C'
              @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_cargos              
            when 'H'
              if  cargo.nivel == 'M'
                @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_horas_media
              end
              if  cargo.nivel == 'S'  
                @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_horas_superior 
              end           
            when 'A'
              @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_auxiliares    
          end
          @concepto_liquidacion.save
        end    

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
    cargo = Cargo.find(AgenteCargo.find(@liquidacion.agente_cargo_id).cargo_id)

    #Elimino todos los conceptos incluidos en la liquidacion
    @conceptos_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => @liquidacion.id)
    @conceptos_liquidacion.each do |concepto|
      concepto.destroy
    end

    #Levanto los conceptos seleccionados
    @conceptos_seleccionados = params[:codigos][:seleccionados]

    #Creo el objeto ConceptoLiquidacion    
    @conceptos_seleccionados.each do | concepto_id |
      @concepto_liquidacion = ConceptoLiquidacion.new
      @concepto_liquidacion.liquidacion_id = @liquidacion.id
      @concepto_liquidacion.concepto_id = concepto_id
      @concepto_liquidacion.formula_calculo = "formula completa"
      @concepto_liquidacion.calculo = "formula solo con numeros"
      @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_auxiliares
      case cargo.tipo_cargo
        when 'C'
          @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_cargos              
        when 'H'
          if  cargo.nivel == 'M'
            @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_horas_media
          end
          if  cargo.nivel == 'S'  
            @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_horas_superior 
          end           
        when 'A'
          @concepto_liquidacion.valor_calculado = Concepto.find(concepto_id).calculo_auxiliares    
      end
      @concepto_liquidacion.save
    end    

    respond_to do |format|
      if @liquidacion.update_attributes(params[:liquidacion])
        format.html { redirect_to @liquidacion, notice: 'Liquidacion was successfully updated.' }
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
end
