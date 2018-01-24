require 'test_helper'

class ContactAboutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_about = contact_abouts(:one)
  end

  test "should get index" do
    get contact_abouts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_about_url
    assert_response :success
  end

  test "should create contact_about" do
    assert_difference('ContactAbout.count') do
      post contact_abouts_url, params: { contact_about: { descripcion: @contact_about.descripcion } }
    end

    assert_redirected_to contact_about_url(ContactAbout.last)
  end

  test "should show contact_about" do
    get contact_about_url(@contact_about)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_about_url(@contact_about)
    assert_response :success
  end

  test "should update contact_about" do
    patch contact_about_url(@contact_about), params: { contact_about: { descripcion: @contact_about.descripcion } }
    assert_redirected_to contact_about_url(@contact_about)
  end

  test "should destroy contact_about" do
    assert_difference('ContactAbout.count', -1) do
      delete contact_about_url(@contact_about)
    end

    assert_redirected_to contact_abouts_url
  end
end
