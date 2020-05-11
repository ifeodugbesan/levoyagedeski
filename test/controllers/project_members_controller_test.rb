require 'test_helper'

class ProjectMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get project_members_new_url
    assert_response :success
  end

  test "should get create" do
    get project_members_create_url
    assert_response :success
  end

  test "should get destroy" do
    get project_members_destroy_url
    assert_response :success
  end

end
