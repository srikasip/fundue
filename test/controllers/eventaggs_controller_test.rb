require 'test_helper'

class EventaggsControllerTest < ActionController::TestCase
  setup do
    @eventagg = eventaggs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventaggs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventagg" do
    assert_difference('Eventagg.count') do
      post :create, eventagg: { domain: @eventagg.domain, eventpage: @eventagg.eventpage, link: @eventagg.link, name: @eventagg.name, pagination: @eventagg.pagination, site_type: @eventagg.site_type }
    end

    assert_redirected_to eventagg_path(assigns(:eventagg))
  end

  test "should show eventagg" do
    get :show, id: @eventagg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventagg
    assert_response :success
  end

  test "should update eventagg" do
    patch :update, id: @eventagg, eventagg: { domain: @eventagg.domain, eventpage: @eventagg.eventpage, link: @eventagg.link, name: @eventagg.name, pagination: @eventagg.pagination, site_type: @eventagg.site_type }
    assert_redirected_to eventagg_path(assigns(:eventagg))
  end

  test "should destroy eventagg" do
    assert_difference('Eventagg.count', -1) do
      delete :destroy, id: @eventagg
    end

    assert_redirected_to eventaggs_path
  end
end
