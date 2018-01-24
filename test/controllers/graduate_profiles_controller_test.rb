require 'test_helper'

class GraduateProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @graduate_profile = graduate_profiles(:one)
  end

  test "should get index" do
    get graduate_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_graduate_profile_url
    assert_response :success
  end

  test "should create graduate_profile" do
    assert_difference('GraduateProfile.count') do
      post graduate_profiles_url, params: { graduate_profile: { descripcion: @graduate_profile.descripcion } }
    end

    assert_redirected_to graduate_profile_url(GraduateProfile.last)
  end

  test "should show graduate_profile" do
    get graduate_profile_url(@graduate_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_graduate_profile_url(@graduate_profile)
    assert_response :success
  end

  test "should update graduate_profile" do
    patch graduate_profile_url(@graduate_profile), params: { graduate_profile: { descripcion: @graduate_profile.descripcion } }
    assert_redirected_to graduate_profile_url(@graduate_profile)
  end

  test "should destroy graduate_profile" do
    assert_difference('GraduateProfile.count', -1) do
      delete graduate_profile_url(@graduate_profile)
    end

    assert_redirected_to graduate_profiles_url
  end
end
