require 'test_helper'

class EnigmasControllerTest < ActionController::TestCase
  setup do
    @enigma = enigmas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enigmas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enigma" do
    assert_difference('Enigma.count') do
      post :create, enigma: { content: @enigma.content, long_solution: @enigma.long_solution, name: @enigma.name, short_solution: @enigma.short_solution, title: @enigma.title }
    end

    assert_redirected_to enigma_path(assigns(:enigma))
  end

  test "should show enigma" do
    get :show, id: @enigma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enigma
    assert_response :success
  end

  test "should update enigma" do
    put :update, id: @enigma, enigma: { content: @enigma.content, long_solution: @enigma.long_solution, name: @enigma.name, short_solution: @enigma.short_solution, title: @enigma.title }
    assert_redirected_to enigma_path(assigns(:enigma))
  end

  test "should destroy enigma" do
    assert_difference('Enigma.count', -1) do
      delete :destroy, id: @enigma
    end

    assert_redirected_to enigmas_path
  end
end
