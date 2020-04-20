require 'test_helper'

class CareersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get careers_index_url
    assert_response :success
  end

  test "should get show" do
    get careers_show_url
    assert_response :success
  end

  test "should get new" do
    get careers_new_url
    assert_response :success
  end

  test "should get create" do
    get careers_create_url
    assert_response :success
  end

  test "should get edit" do
    get careers_edit_url
    assert_response :success
  end

  test "should get update" do
    get careers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get careers_destroy_url
    assert_response :success
  end

end
