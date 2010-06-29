require 'test_helper'

class ParagraphsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paragraphs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paragraph" do
    assert_difference('Paragraph.count') do
      post :create, :paragraph => { }
    end

    assert_redirected_to paragraph_path(assigns(:paragraph))
  end

  test "should show paragraph" do
    get :show, :id => paragraphs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => paragraphs(:one).to_param
    assert_response :success
  end

  test "should update paragraph" do
    put :update, :id => paragraphs(:one).to_param, :paragraph => { }
    assert_redirected_to paragraph_path(assigns(:paragraph))
  end

  test "should destroy paragraph" do
    assert_difference('Paragraph.count', -1) do
      delete :destroy, :id => paragraphs(:one).to_param
    end

    assert_redirected_to paragraphs_path
  end
end
