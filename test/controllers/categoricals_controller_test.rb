require 'test_helper'

class CategoricalsControllerTest < ActionController::TestCase
  setup do
    @categorical = categoricals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoricals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categorical" do
    assert_difference('Categorical.count') do
      post :create, categorical: {  }
    end

    assert_redirected_to categorical_path(assigns(:categorical))
  end

  test "should show categorical" do
    get :show, id: @categorical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categorical
    assert_response :success
  end

  test "should update categorical" do
    patch :update, id: @categorical, categorical: {  }
    assert_redirected_to categorical_path(assigns(:categorical))
  end

  test "should destroy categorical" do
    assert_difference('Categorical.count', -1) do
      delete :destroy, id: @categorical
    end

    assert_redirected_to categoricals_path
  end
end
