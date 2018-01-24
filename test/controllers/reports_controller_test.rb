require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get line" do
    get reports_line_url
    assert_response :success
  end

  test "should get linexy" do
    get reports_linexy_url
    assert_response :success
  end

  test "should get scatter" do
    get reports_scatter_url
    assert_response :success
  end

  test "should get bar" do
    get reports_bar_url
    assert_response :success
  end

  test "should get venn" do
    get reports_venn_url
    assert_response :success
  end

  test "should get pie" do
    get reports_pie_url
    assert_response :success
  end

  test "should get pie3d" do
    get reports_pie3d_url
    assert_response :success
  end

  test "should get sparkline" do
    get reports_sparkline_url
    assert_response :success
  end

  test "should get meter" do
    get reports_meter_url
    assert_response :success
  end

end
