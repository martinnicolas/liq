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
    @concepto_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => @liquidacion.id)

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
    @conceptos = Concepto.where(:tipo_liquidacion => 'AUXILIAR', :requerido => 'SI')    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @liquidacion }
    end
  end

  # GET /liquidacions/1/edit
  def edit
    
    #Levanto de conceptos, todos los conceptos que son requeridos para liquidacion de auxiliares    
    @conceptos = Concepto.where(:tipo_liquidacion => 'AUXILIAR', :requerido => 'SI')    

    @liquidacion = Liquidacion.find(params[:id])
    @conceptos_liquidacion = ConceptoLiquidacion.where(:liquidacion_id => @liquidacion_id)

  end

  # POST /liquidacions
  # POST /liquidacions.json
  def create
    @liquidacion = Liquidacion.new(params[:liquidacion])

    respond_to do |format|
      if @liquidacion.save
        
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
