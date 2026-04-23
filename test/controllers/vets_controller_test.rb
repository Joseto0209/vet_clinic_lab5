require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should get show" do
    get vet_url(vets(:one))
    assert_response :success
  end
end
