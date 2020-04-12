require 'test_helper'

class BatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get batches_show_url
    assert_response :success
  end

end
