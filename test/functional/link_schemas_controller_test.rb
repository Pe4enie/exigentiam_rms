require 'test_helper'

class LinkSchemasControllerTest < ActionController::TestCase
  setup do
    @link_schema = link_schemas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_schemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_schema" do
    assert_difference('LinkSchema.count') do
      post :create, link_schema: {  }
    end

    assert_redirected_to link_schema_path(assigns(:link_schema))
  end

  test "should show link_schema" do
    get :show, id: @link_schema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_schema
    assert_response :success
  end

  test "should update link_schema" do
    put :update, id: @link_schema, link_schema: {  }
    assert_redirected_to link_schema_path(assigns(:link_schema))
  end

  test "should destroy link_schema" do
    assert_difference('LinkSchema.count', -1) do
      delete :destroy, id: @link_schema
    end

    assert_redirected_to link_schemas_path
  end
end
