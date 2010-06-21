require 'test_helper'

class DomainsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create domain" do
    assert_difference('Domain.count') do
      post :create, :domain => { }
    end

    assert_redirected_to domain_path(assigns(:domain))
  end

  test "should show domain" do
    get :show, :id => domains(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => domains(:one).to_param
    assert_response :success
  end

  test "should update domain" do
    put :update, :id => domains(:one).to_param, :domain => { }
    assert_redirected_to domain_path(assigns(:domain))
  end

  test "should destroy domain" do
    assert_difference('Domain.count', -1) do
      delete :destroy, :id => domains(:one).to_param
    end

    assert_redirected_to domains_path
  end
end
