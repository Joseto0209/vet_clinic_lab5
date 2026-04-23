require "test_helper"

class VetTest < ActiveSupport::TestCase
  def setup
    @vet = Vet.new(
      first_name: "Test",
      last_name: "Vet",
      email: "test.vet@clinic.com",
      phone: "+15550001111",
      specialization: "General Medicine"
    )
  end

  test "valid vet can be saved" do
    assert @vet.valid?
  end

  test "first_name is required" do
    @vet.first_name = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:first_name], "can't be blank"
  end

  test "last_name is required" do
    @vet.last_name = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:last_name], "can't be blank"
  end

  test "email is required" do
    @vet.email = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:email], "can't be blank"
  end

  test "email must have valid format" do
    @vet.email = "invalid-email"
    assert_not @vet.valid?
    assert_includes @vet.errors[:email], "must be a valid email address"
  end

  test "email must be unique" do
    @vet.save!
    duplicate = @vet.dup
    duplicate.email = @vet.email.upcase
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "specialization is required" do
    @vet.specialization = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:specialization], "can't be blank"
  end

  test "email is normalized to lowercase and stripped before validation" do
    @vet.email = "  TEST.VET@CLINIC.COM  "
    @vet.valid?
    assert_equal "test.vet@clinic.com", @vet.email
  end

  test "by_specialization scope returns vets matching specialization" do
    assert_equal Vet.where(specialization: "General Medicine"), Vet.by_specialization("General Medicine")
  end
end
