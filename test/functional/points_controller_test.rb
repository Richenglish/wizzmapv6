require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

  test "should get new" do
    get :new
    assert_response :redirect
    assert_redirected_to login_path
  end

  test "should create point" do
    assert_difference('Point.count') do
      post :create, point: { content: @point.content, lat: @point.lat, long: @point.long, name: @point.name }
    end

    assert_redirected_to point_path(assigns(:point))
  end

  test "should show point" do
    get :show, id: @point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point
    assert_response :success
  end

  test "should update point" do
    put :update, id: @point, point: { content: @point.content, lat: @point.lat, long: @point.long, name: @point.name }
    assert_redirected_to point_path(assigns(:point))
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete :destroy, id: @point
    end

    assert_redirected_to points_path
  end
end
