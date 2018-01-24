require 'test_helper'

class ClassroomLaboratoryResourcesControllerTest < ActionController::TestCase
  setup do
    @classroom_laboratory_resource = classroom_laboratory_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classroom_laboratory_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom_laboratory_resource" do
    assert_difference('ClassroomLaboratoryResource.count') do
      post :create, classroom_laboratory_resource: { classroom_laboratory_id: @classroom_laboratory_resource.classroom_laboratory_id, resource_id: @classroom_laboratory_resource.resource_id, state_id: @classroom_laboratory_resource.state_id }
    end

    assert_redirected_to classroom_laboratory_resource_path(assigns(:classroom_laboratory_resource))
  end

  test "should show classroom_laboratory_resource" do
    get :show, id: @classroom_laboratory_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom_laboratory_resource
    assert_response :success
  end

  test "should update classroom_laboratory_resource" do
    patch :update, id: @classroom_laboratory_resource, classroom_laboratory_resource: { classroom_laboratory_id: @classroom_laboratory_resource.classroom_laboratory_id, resource_id: @classroom_laboratory_resource.resource_id, state_id: @classroom_laboratory_resource.state_id }
    assert_redirected_to classroom_laboratory_resource_path(assigns(:classroom_laboratory_resource))
  end

  test "should destroy classroom_laboratory_resource" do
    assert_difference('ClassroomLaboratoryResource.count', -1) do
      delete :destroy, id: @classroom_laboratory_resource
    end

    assert_redirected_to classroom_laboratory_resources_path
  end
end
