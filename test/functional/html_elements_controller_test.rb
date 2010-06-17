require 'test_helper'

class HtmlElementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:html_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create html_element" do
    assert_difference('HtmlElement.count') do
      post :create, :html_element => { }
    end

    assert_redirected_to html_element_path(assigns(:html_element))
  end

  test "should show html_element" do
    get :show, :id => html_elements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => html_elements(:one).to_param
    assert_response :success
  end

  test "should update html_element" do
    put :update, :id => html_elements(:one).to_param, :html_element => { }
    assert_redirected_to html_element_path(assigns(:html_element))
  end

  test "should destroy html_element" do
    assert_difference('HtmlElement.count', -1) do
      delete :destroy, :id => html_elements(:one).to_param
    end

    assert_redirected_to html_elements_path
  end
end
