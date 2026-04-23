require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get show" do
    get pet_url(pets(:one))
    assert_response :success
  end
end
