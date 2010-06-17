require 'test_helper'

class TextsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text" do
    assert_difference('Text.count') do
      post :create, :text => { }
    end

    assert_redirected_to text_path(assigns(:text))
  end

  test "should show text" do
    get :show, :id => texts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => texts(:one).to_param
    assert_response :success
  end

  test "should update text" do
    put :update, :id => texts(:one).to_param, :text => { }
    assert_redirected_to text_path(assigns(:text))
  end

  test "should destroy text" do
    assert_difference('Text.count', -1) do
      delete :destroy, :id => texts(:one).to_param
    end

    assert_redirected_to texts_path
  end
end
