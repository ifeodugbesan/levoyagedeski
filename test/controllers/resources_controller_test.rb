require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resources_index_url
    assert_response :success
  end

  test "should get new" do
    get resources_new_url
    assert_response :success
  end

  test "should get create" do
    get resources_create_url
    assert_response :success
  end

  test "should get edit" do
    get resources_edit_url
    assert_response :success
  end

  test "should get update" do
    get resources_update_url
    assert_response :success
  end

  test "should get destroy" do
    get resources_destroy_url
    assert_response :success
  end

end
