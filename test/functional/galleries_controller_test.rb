require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery" do
    assert_difference('Gallery.count') do
      post :create, :gallery => { }
    end

    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should show gallery" do
    get :show, :id => galleries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => galleries(:one).to_param
    assert_response :success
  end

  test "should update gallery" do
    put :update, :id => galleries(:one).to_param, :gallery => { }
    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should destroy gallery" do
    assert_difference('Gallery.count', -1) do
      delete :destroy, :id => galleries(:one).to_param
    end

    assert_redirected_to galleries_path
  end
end
