require 'test_helper'

class LiquidacionsControllerTest < ActionController::TestCase
  setup do
    @liquidacion = liquidacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquidacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquidacion" do
    assert_difference('Liquidacion.count') do
      post :create, liquidacion: { agente_cargo_id: @liquidacion.agente_cargo_id, dias_trabajados: @liquidacion.dias_trabajados, fecha: @liquidacion.fecha, tipo_liquidacion: @liquidacion.tipo_liquidacion }
    end

    assert_redirected_to liquidacion_path(assigns(:liquidacion))
  end

  test "should show liquidacion" do
    get :show, id: @liquidacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquidacion
    assert_response :success
  end

  test "should update liquidacion" do
    put :update, id: @liquidacion, liquidacion: { agente_cargo_id: @liquidacion.agente_cargo_id, dias_trabajados: @liquidacion.dias_trabajados, fecha: @liquidacion.fecha, tipo_liquidacion: @liquidacion.tipo_liquidacion }
    assert_redirected_to liquidacion_path(assigns(:liquidacion))
  end

  test "should destroy liquidacion" do
    assert_difference('Liquidacion.count', -1) do
      delete :destroy, id: @liquidacion
    end

    assert_redirected_to liquidacions_path
  end
end
