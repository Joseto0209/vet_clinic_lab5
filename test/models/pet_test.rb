require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = owners(:one)
    @pet = Pet.new(
      name: "TestPet",
      species: "dog",
      breed: "Labrador",
      date_of_birth: Date.new(2020, 1, 15),
      weight: 10.0,
      owner: @owner
    )
  end

  test "valid pet can be saved" do
    assert @pet.valid?
  end

  test "name is required" do
    @pet.name = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:name], "can't be blank"
  end

  test "species is required" do
    @pet.species = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:species], "can't be blank"
  end

  test "species must be a valid option" do
    @pet.species = "dragon"
    assert_not @pet.valid?
    assert_includes @pet.errors[:species], "dragon is not a valid species"
  end

  test "species accepts all valid values" do
    %w[dog cat rabbit bird reptile other].each do |valid_species|
      @pet.species = valid_species
      assert @pet.valid?, "#{valid_species} should be a valid species"
    end
  end

  test "date_of_birth is required" do
    @pet.date_of_birth = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:date_of_birth], "can't be blank"
  end

  test "date_of_birth cannot be in the future" do
    @pet.date_of_birth = Date.tomorrow
    assert_not @pet.valid?
    assert_includes @pet.errors[:date_of_birth], "can't be in the future"
  end

  test "weight is required" do
    @pet.weight = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:weight], "can't be blank"
  end

  test "weight must be greater than 0" do
    @pet.weight = 0
    assert_not @pet.valid?
    assert_includes @pet.errors[:weight], "must be greater than 0"
  end

  test "weight must be a number" do
    @pet.weight = "abc"
    assert_not @pet.valid?
    assert_includes @pet.errors[:weight], "is not a number"
  end

  test "owner is required" do
    @pet.owner = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:owner], "must exist"
  end

  test "name is capitalized before saving" do
    @pet.name = "buddy"
    @pet.save!
    assert_equal "Buddy", @pet.name
  end

  test "by_species scope returns pets matching species" do
    assert_equal Pet.where(species: "dog"), Pet.by_species("dog")
  end
end
