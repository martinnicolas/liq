require 'test_helper'

class ConceptosControllerTest < ActionController::TestCase
  setup do
    @concepto = conceptos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conceptos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concepto" do
    assert_difference('Concepto.count') do
      post :create, concepto: { activado_x_defecto: @concepto.activado_x_defecto, ayuda: @concepto.ayuda, calculo_cargos: @concepto.calculo_cargos, calculo_horas_media: @concepto.calculo_horas_media, calculo_horas_superior: @concepto.calculo_horas_superior, carga_manual: @concepto.carga_manual, codigo: @concepto.codigo, nombre: @concepto.nombre, requerido: @concepto.requerido, tipo: @concepto.tipo, tipo_liquidacion: @concepto.tipo_liquidacion }
    end

    assert_redirected_to concepto_path(assigns(:concepto))
  end

  test "should show concepto" do
    get :show, id: @concepto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concepto
    assert_response :success
  end

  test "should update concepto" do
    put :update, id: @concepto, concepto: { activado_x_defecto: @concepto.activado_x_defecto, ayuda: @concepto.ayuda, calculo_cargos: @concepto.calculo_cargos, calculo_horas_media: @concepto.calculo_horas_media, calculo_horas_superior: @concepto.calculo_horas_superior, carga_manual: @concepto.carga_manual, codigo: @concepto.codigo, nombre: @concepto.nombre, requerido: @concepto.requerido, tipo: @concepto.tipo, tipo_liquidacion: @concepto.tipo_liquidacion }
    assert_redirected_to concepto_path(assigns(:concepto))
  end

  test "should destroy concepto" do
    assert_difference('Concepto.count', -1) do
      delete :destroy, id: @concepto
    end

    assert_redirected_to conceptos_path
  end
end
