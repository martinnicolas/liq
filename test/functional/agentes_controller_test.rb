require 'test_helper'

class AgentesControllerTest < ActionController::TestCase
  setup do
    @agente = agentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agente" do
    assert_difference('Agente.count') do
      post :create, agente: { apellido: @agente.apellido, cuit_cuil: @agente.cuit_cuil, dni: @agente.dni, escuela_id: @agente.escuela_id, fecha_ingreso: @agente.fecha_ingreso, localidad_id: @agente.localidad_id, nombre: @agente.nombre }
    end

    assert_redirected_to agente_path(assigns(:agente))
  end

  test "should show agente" do
    get :show, id: @agente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agente
    assert_response :success
  end

  test "should update agente" do
    put :update, id: @agente, agente: { apellido: @agente.apellido, cuit_cuil: @agente.cuit_cuil, dni: @agente.dni, escuela_id: @agente.escuela_id, fecha_ingreso: @agente.fecha_ingreso, localidad_id: @agente.localidad_id, nombre: @agente.nombre }
    assert_redirected_to agente_path(assigns(:agente))
  end

  test "should destroy agente" do
    assert_difference('Agente.count', -1) do
      delete :destroy, id: @agente
    end

    assert_redirected_to agentes_path
  end
end
