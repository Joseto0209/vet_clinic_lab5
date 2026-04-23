require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.new(
      first_name: "Test",
      last_name: "Owner",
      email: "test.owner@example.com",
      phone: "+15550001111",
      address: "123 Test St"
    )
  end

  test "valid owner can be saved" do
    assert @owner.valid?
  end

  test "first_name is required" do
    @owner.first_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:first_name], "can't be blank"
  end

  test "last_name is required" do
    @owner.last_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:last_name], "can't be blank"
  end

  test "email is required" do
    @owner.email = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:email], "can't be blank"
  end

  test "email must have valid format" do
    @owner.email = "not-an-email"
    assert_not @owner.valid?
    assert_includes @owner.errors[:email], "must be a valid email address"
  end

  test "email must be unique" do
    @owner.save!
    duplicate = @owner.dup
    duplicate.email = @owner.email.upcase
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "phone is required" do
    @owner.phone = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:phone], "can't be blank"
  end

  test "email is normalized to lowercase and stripped before validation" do
    @owner.email = "  TEST.Owner@EXAMPLE.COM  "
    @owner.valid?
    assert_equal "test.owner@example.com", @owner.email
  end
end
