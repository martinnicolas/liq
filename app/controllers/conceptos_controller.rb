class ConceptosController < ApplicationController
  # GET /conceptos
  # GET /conceptos.json
  def index
    @conceptos = Concepto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conceptos }
    end
  end

  # GET /conceptos/1
  # GET /conceptos/1.json
  def show
    @concepto = Concepto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concepto }
    end
  end

  # GET /conceptos/new
  # GET /conceptos/new.json
  def new
    @concepto = Concepto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concepto }
    end
  end

  # GET /conceptos/1/edit
  def edit
    @concepto = Concepto.find(params[:id])
  end

  # POST /conceptos
  # POST /conceptos.json
  def create
    @concepto = Concepto.new(params[:concepto])

    respond_to do |format|
      if @concepto.save
        format.html { redirect_to @concepto, notice: 'Concepto was successfully created.' }
        format.json { render json: @concepto, status: :created, location: @concepto }
      else
        format.html { render action: "new" }
        format.json { render json: @concepto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conceptos/1
  # PUT /conceptos/1.json
  def update
    @concepto = Concepto.find(params[:id])

    respond_to do |format|
      if @concepto.update_attributes(params[:concepto])
        format.html { redirect_to @concepto, notice: 'Concepto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concepto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conceptos/1
  # DELETE /conceptos/1.json
  def destroy
    @concepto = Concepto.find(params[:id])
    @concepto.destroy

    respond_to do |format|
      format.html { redirect_to conceptos_url }
      format.json { head :no_content }
    end
  end
end
