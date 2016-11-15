require 'test_helper'

class PuntosControllerTest < ActionController::TestCase
  test "should get sumar_uno" do
    get :sumar_uno
    assert_response :success
  end

  test "should get restar_uno" do
    get :restar_uno
    assert_response :success
  end

  test "should get restar_dos" do
    get :restar_dos
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get comprar" do
    get :comprar
    assert_response :success
  end

end
