require 'test_helper'

class ArtifactStatusesControllerTest < ActionController::TestCase
  setup do
    @artifact_status = artifact_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artifact_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artifact_status" do
    assert_difference('ArtifactStatus.count') do
      post :create, artifact_status: { title: @artifact_status.title }
    end

    assert_redirected_to artifact_status_path(assigns(:artifact_status))
  end

  test "should show artifact_status" do
    get :show, id: @artifact_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artifact_status
    assert_response :success
  end

  test "should update artifact_status" do
    put :update, id: @artifact_status, artifact_status: { title: @artifact_status.title }
    assert_redirected_to artifact_status_path(assigns(:artifact_status))
  end

  test "should destroy artifact_status" do
    assert_difference('ArtifactStatus.count', -1) do
      delete :destroy, id: @artifact_status
    end

    assert_redirected_to artifact_statuses_path
  end
end
