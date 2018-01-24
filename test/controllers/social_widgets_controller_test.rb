require 'test_helper'

class SocialWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_widget = social_widgets(:one)
  end

  test "should get index" do
    get social_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_social_widget_url
    assert_response :success
  end

  test "should create social_widget" do
    assert_difference('SocialWidget.count') do
      post social_widgets_url, params: { social_widget: { facebook: @social_widget.facebook, instagram: @social_widget.instagram, linkedin: @social_widget.linkedin, twitter: @social_widget.twitter } }
    end

    assert_redirected_to social_widget_url(SocialWidget.last)
  end

  test "should show social_widget" do
    get social_widget_url(@social_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_widget_url(@social_widget)
    assert_response :success
  end

  test "should update social_widget" do
    patch social_widget_url(@social_widget), params: { social_widget: { facebook: @social_widget.facebook, instagram: @social_widget.instagram, linkedin: @social_widget.linkedin, twitter: @social_widget.twitter } }
    assert_redirected_to social_widget_url(@social_widget)
  end

  test "should destroy social_widget" do
    assert_difference('SocialWidget.count', -1) do
      delete social_widget_url(@social_widget)
    end

    assert_redirected_to social_widgets_url
  end
end
