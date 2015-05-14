require 'test_helper'

class GreetingsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get howto" do
    get :howto
    assert_response :success
  end

end
