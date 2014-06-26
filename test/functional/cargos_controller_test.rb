require 'test_helper'

class CargosControllerTest < ActionController::TestCase
  setup do
    @cargo = cargos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo" do
    assert_difference('Cargo.count') do
      post :create, cargo: { basico: @cargo.basico, categoria: @cargo.categoria, descripcion: @cargo.descripcion, doble: @cargo.doble, hbase: @cargo.hbase, hscargo: @cargo.hscargo, hstexto: @cargo.hstexto, indice: @cargo.indice, nivel: @cargo.nivel, puntos: @cargo.puntos, testigo: @cargo.testigo, tipo_cargo: @cargo.tipo_cargo }
    end

    assert_redirected_to cargo_path(assigns(:cargo))
  end

  test "should show cargo" do
    get :show, id: @cargo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo
    assert_response :success
  end

  test "should update cargo" do
    put :update, id: @cargo, cargo: { basico: @cargo.basico, categoria: @cargo.categoria, descripcion: @cargo.descripcion, doble: @cargo.doble, hbase: @cargo.hbase, hscargo: @cargo.hscargo, hstexto: @cargo.hstexto, indice: @cargo.indice, nivel: @cargo.nivel, puntos: @cargo.puntos, testigo: @cargo.testigo, tipo_cargo: @cargo.tipo_cargo }
    assert_redirected_to cargo_path(assigns(:cargo))
  end

  test "should destroy cargo" do
    assert_difference('Cargo.count', -1) do
      delete :destroy, id: @cargo
    end

    assert_redirected_to cargos_path
  end
end
