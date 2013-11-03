require 'test_helper'

class HousingsControllerTest < ActionController::TestCase
  setup do
    @housing = housings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing" do
    assert_difference('Housing.count') do
      post :create, housing: { address: @housing.address, description: @housing.description, image_url: @housing.image_url, title: @housing.title }
    end

    assert_redirected_to housing_path(assigns(:housing))
  end

  test "should show housing" do
    get :show, id: @housing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @housing
    assert_response :success
  end

  test "should update housing" do
    patch :update, id: @housing, housing: { address: @housing.address, description: @housing.description, image_url: @housing.image_url, title: @housing.title }
    assert_redirected_to housing_path(assigns(:housing))
  end

  test "should destroy housing" do
    assert_difference('Housing.count', -1) do
      delete :destroy, id: @housing
    end

    assert_redirected_to housings_path
  end
end
