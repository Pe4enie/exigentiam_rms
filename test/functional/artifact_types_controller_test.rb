require 'test_helper'

class ArtifactTypesControllerTest < ActionController::TestCase
  setup do
    @artifact_type = artifact_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artifact_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artifact_type" do
    assert_difference('ArtifactType.count') do
      post :create, artifact_type: { title: @artifact_type.title }
    end

    assert_redirected_to artifact_type_path(assigns(:artifact_type))
  end

  test "should show artifact_type" do
    get :show, id: @artifact_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artifact_type
    assert_response :success
  end

  test "should update artifact_type" do
    put :update, id: @artifact_type, artifact_type: { title: @artifact_type.title }
    assert_redirected_to artifact_type_path(assigns(:artifact_type))
  end

  test "should destroy artifact_type" do
    assert_difference('ArtifactType.count', -1) do
      delete :destroy, id: @artifact_type
    end

    assert_redirected_to artifact_types_path
  end
end
