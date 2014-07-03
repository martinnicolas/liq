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
    @liquidacion = Liquidacion.find(params[:id])
  end

  # POST /liquidacions
  # POST /liquidacions.json
  def create
    @liquidacion = Liquidacion.new(params[:liquidacion])

    #Levanto los conceptos seleccionados
    @conceptos_seleccionados = params[:codigos][:seleccionados]

    #Creo el objeto ConceptoLiquidacion    
    @conceptos_seleccionados.each do | concepto_id |
      @concepto_liquidacion = ConceptoLiquidacion.new
      @concepto_liquidacion.liquidacion_id = @liquidacion
      @concepto_liquidacion.concepto_id = concepto_id
      @concepto_liquidacion.formula_calculo = "formula completa"
      @concepto_liquidacion.calculo = "formula solo con numeros"
      @concepto_liquidacion.valor_calculado = 0.0
      @concepto_liquidacion.save
    end    

    respond_to do |format|
      if @liquidacion.save
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
    @liquidacion.destroy

    respond_to do |format|
      format.html { redirect_to liquidacions_url }
      format.json { head :no_content }
    end
  end
end
