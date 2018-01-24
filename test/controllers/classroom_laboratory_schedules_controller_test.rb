require 'test_helper'

class ClassroomLaboratorySchedulesControllerTest < ActionController::TestCase
  setup do
    @classroom_laboratory_schedule = classroom_laboratory_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classroom_laboratory_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom_laboratory_schedule" do
    assert_difference('ClassroomLaboratorySchedule.count') do
      post :create, classroom_laboratory_schedule: { classroom_laboratory_id: @classroom_laboratory_schedule.classroom_laboratory_id, schedule_id: @classroom_laboratory_schedule.schedule_id }
    end

    assert_redirected_to classroom_laboratory_schedule_path(assigns(:classroom_laboratory_schedule))
  end

  test "should show classroom_laboratory_schedule" do
    get :show, id: @classroom_laboratory_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom_laboratory_schedule
    assert_response :success
  end

  test "should update classroom_laboratory_schedule" do
    patch :update, id: @classroom_laboratory_schedule, classroom_laboratory_schedule: { classroom_laboratory_id: @classroom_laboratory_schedule.classroom_laboratory_id, schedule_id: @classroom_laboratory_schedule.schedule_id }
    assert_redirected_to classroom_laboratory_schedule_path(assigns(:classroom_laboratory_schedule))
  end

  test "should destroy classroom_laboratory_schedule" do
    assert_difference('ClassroomLaboratorySchedule.count', -1) do
      delete :destroy, id: @classroom_laboratory_schedule
    end

    assert_redirected_to classroom_laboratory_schedules_path
  end
end
