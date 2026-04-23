require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should get show" do
    get owner_url(owners(:one))
    assert_response :success
  end
end
