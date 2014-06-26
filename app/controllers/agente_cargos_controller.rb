class AgenteCargosController < ApplicationController
  # GET /agente_cargos
  # GET /agente_cargos.json
  def index
    @agente_cargos = AgenteCargo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agente_cargos }
    end
  end

  # GET /agente_cargos/1
  # GET /agente_cargos/1.json
  def show
    @agente_cargo = AgenteCargo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agente_cargo }
    end
  end

  # GET /agente_cargos/new
  # GET /agente_cargos/new.json
  def new
    @agente_cargo = AgenteCargo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agente_cargo }
    end
  end

  # GET /agente_cargos/1/edit
  def edit
    @agente_cargo = AgenteCargo.find(params[:id])
  end

  # POST /agente_cargos
  # POST /agente_cargos.json
  def create
    @agente_cargo = AgenteCargo.new(params[:agente_cargo])

    respond_to do |format|
      if @agente_cargo.save
        format.html { redirect_to @agente_cargo, notice: 'Agente cargo was successfully created.' }
        format.json { render json: @agente_cargo, status: :created, location: @agente_cargo }
      else
        format.html { render action: "new" }
        format.json { render json: @agente_cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agente_cargos/1
  # PUT /agente_cargos/1.json
  def update
    @agente_cargo = AgenteCargo.find(params[:id])

    respond_to do |format|
      if @agente_cargo.update_attributes(params[:agente_cargo])
        format.html { redirect_to @agente_cargo, notice: 'Agente cargo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agente_cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agente_cargos/1
  # DELETE /agente_cargos/1.json
  def destroy
    @agente_cargo = AgenteCargo.find(params[:id])
    @agente_cargo.destroy

    respond_to do |format|
      format.html { redirect_to agente_cargos_url }
      format.json { head :no_content }
    end
  end
end
