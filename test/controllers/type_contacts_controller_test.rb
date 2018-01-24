require 'test_helper'

class TypeContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_contact = type_contacts(:one)
  end

  test "should get index" do
    get type_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_type_contact_url
    assert_response :success
  end

  test "should create type_contact" do
    assert_difference('TypeContact.count') do
      post type_contacts_url, params: { type_contact: { descripcion: @type_contact.descripcion } }
    end

    assert_redirected_to type_contact_url(TypeContact.last)
  end

  test "should show type_contact" do
    get type_contact_url(@type_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_contact_url(@type_contact)
    assert_response :success
  end

  test "should update type_contact" do
    patch type_contact_url(@type_contact), params: { type_contact: { descripcion: @type_contact.descripcion } }
    assert_redirected_to type_contact_url(@type_contact)
  end

  test "should destroy type_contact" do
    assert_difference('TypeContact.count', -1) do
      delete type_contact_url(@type_contact)
    end

    assert_redirected_to type_contacts_url
  end
end
