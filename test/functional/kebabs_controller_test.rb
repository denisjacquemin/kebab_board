require 'test_helper'

class KebabsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kebabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kebab" do
    assert_difference('Kebab.count') do
      post :create, :kebab => { }
    end

    assert_redirected_to kebab_path(assigns(:kebab))
  end

  test "should show kebab" do
    get :show, :id => kebabs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kebabs(:one).to_param
    assert_response :success
  end

  test "should update kebab" do
    put :update, :id => kebabs(:one).to_param, :kebab => { }
    assert_redirected_to kebab_path(assigns(:kebab))
  end

  test "should destroy kebab" do
    assert_difference('Kebab.count', -1) do
      delete :destroy, :id => kebabs(:one).to_param
    end

    assert_redirected_to kebabs_path
  end
end
