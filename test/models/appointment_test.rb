require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @appointment = Appointment.new(
      pet: pets(:one),
      vet: vets(:one),
      date: Time.current + 1.day,
      reason: "Routine checkup",
      status: :scheduled
    )
  end

  test "valid appointment can be saved" do
    assert @appointment.valid?
  end

  test "date is required" do
    @appointment.date = nil
    assert_not @appointment.valid?
    assert_includes @appointment.errors[:date], "can't be blank"
  end

  test "reason is required" do
    @appointment.reason = nil
    assert_not @appointment.valid?
    assert_includes @appointment.errors[:reason], "can't be blank"
  end

  test "pet is required" do
    @appointment.pet = nil
    assert_not @appointment.valid?
    assert_includes @appointment.errors[:pet], "must exist"
  end

  test "vet is required" do
    @appointment.vet = nil
    assert_not @appointment.valid?
    assert_includes @appointment.errors[:vet], "must exist"
  end

  test "status is required" do
    @appointment.status = nil
    assert_not @appointment.valid?
    assert_includes @appointment.errors[:status], "can't be blank"
  end

  test "status enum has correct values" do
    assert_equal({ "scheduled" => 0, "in_progress" => 1, "completed" => 2, "cancelled" => 3 }, Appointment.statuses)
  end

  test "upcoming scope returns future appointments ordered ascending" do
    upcoming = Appointment.upcoming
    assert upcoming.all? { |a| a.date > Time.current }
  end

  test "past scope returns past appointments ordered descending" do
    past = Appointment.past
    assert past.all? { |a| a.date < Time.current }
  end
end
