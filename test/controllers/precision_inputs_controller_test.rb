require 'test_helper'

class PrecisionInputsControllerTest < ActionController::TestCase
  setup do
    @precision_input = precision_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:precision_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create precision_input" do
    assert_difference('PrecisionInput.count') do
      post :create, precision_input: { event_id: @precision_input.event_id, field_name: @precision_input.field_name, how_wrong: @precision_input.how_wrong, is_correct: @precision_input.is_correct, session_id: @precision_input.session_id }
    end

    assert_redirected_to precision_input_path(assigns(:precision_input))
  end

  test "should show precision_input" do
    get :show, id: @precision_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @precision_input
    assert_response :success
  end

  test "should update precision_input" do
    patch :update, id: @precision_input, precision_input: { event_id: @precision_input.event_id, field_name: @precision_input.field_name, how_wrong: @precision_input.how_wrong, is_correct: @precision_input.is_correct, session_id: @precision_input.session_id }
    assert_redirected_to precision_input_path(assigns(:precision_input))
  end

  test "should destroy precision_input" do
    assert_difference('PrecisionInput.count', -1) do
      delete :destroy, id: @precision_input
    end

    assert_redirected_to precision_inputs_path
  end
end
