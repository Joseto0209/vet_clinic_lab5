require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get show" do
    get appointment_url(appointments(:one))
    assert_response :success
  end
end
