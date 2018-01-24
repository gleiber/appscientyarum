require 'test_helper'

class DayWeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_week = day_weeks(:one)
  end

  test "should get index" do
    get day_weeks_url
    assert_response :success
  end

  test "should get new" do
    get new_day_week_url
    assert_response :success
  end

  test "should create day_week" do
    assert_difference('DayWeek.count') do
      post day_weeks_url, params: { day_week: { descripcion: @day_week.descripcion } }
    end

    assert_redirected_to day_week_url(DayWeek.last)
  end

  test "should show day_week" do
    get day_week_url(@day_week)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_week_url(@day_week)
    assert_response :success
  end

  test "should update day_week" do
    patch day_week_url(@day_week), params: { day_week: { descripcion: @day_week.descripcion } }
    assert_redirected_to day_week_url(@day_week)
  end

  test "should destroy day_week" do
    assert_difference('DayWeek.count', -1) do
      delete day_week_url(@day_week)
    end

    assert_redirected_to day_weeks_url
  end
end
