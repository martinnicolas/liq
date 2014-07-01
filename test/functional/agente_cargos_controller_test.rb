require 'test_helper'

class AgenteCargosControllerTest < ActionController::TestCase
  setup do
    @agente_cargo = agente_cargos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agente_cargos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agente_cargo" do
    assert_difference('AgenteCargo.count') do
      post :create, agente_cargo: { agente_id: @agente_cargo.agente_id, cant_horas: @agente_cargo.cant_horas, cargo_id: @agente_cargo.cargo_id, descripcion: @agente_cargo.descripcion, establecimiento_id: @agente_cargo.establecimiento_id, estado: @agente_cargo.estado, fecha_creacion: @agente_cargo.fecha_creacion, secuencia: @agente_cargo.secuencia }
    end

    assert_redirected_to agente_cargo_path(assigns(:agente_cargo))
  end

  test "should show agente_cargo" do
    get :show, id: @agente_cargo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agente_cargo
    assert_response :success
  end

  test "should update agente_cargo" do
    put :update, id: @agente_cargo, agente_cargo: { agente_id: @agente_cargo.agente_id, cant_horas: @agente_cargo.cant_horas, cargo_id: @agente_cargo.cargo_id, descripcion: @agente_cargo.descripcion, establecimiento_id: @agente_cargo.establecimiento_id, estado: @agente_cargo.estado, fecha_creacion: @agente_cargo.fecha_creacion, secuencia: @agente_cargo.secuencia }
    assert_redirected_to agente_cargo_path(assigns(:agente_cargo))
  end

  test "should destroy agente_cargo" do
    assert_difference('AgenteCargo.count', -1) do
      delete :destroy, id: @agente_cargo
    end

    assert_redirected_to agente_cargos_path
  end
end
