require 'test_helper'

class ShopsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post :create, :shop => { }
    end

    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should show shop" do
    get :show, :id => shops(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shops(:one).to_param
    assert_response :success
  end

  test "should update shop" do
    put :update, :id => shops(:one).to_param, :shop => { }
    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete :destroy, :id => shops(:one).to_param
    end

    assert_redirected_to shops_path
  end
end
