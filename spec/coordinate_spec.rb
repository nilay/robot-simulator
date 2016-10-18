require "coordinates"

describe Coordinates do
  it "X are incremented for positive value" do
    boundry_coordinate = Coordinates.new(2,3)
    boundry_coordinate = boundry_coordinate.new_coordinates_for(1, 0)
    expect("#{boundry_coordinate}").to eql("3,3")
  end

  it "X are decremented for negative value" do
    boundry_coordinate = Coordinates.new(2,3)
    boundry_coordinate = boundry_coordinate.new_coordinates_for(-1, 0)
    expect("#{boundry_coordinate}").to eql("1,3")
  end

  it "Y are incremented for positive value" do
    boundry_coordinate = Coordinates.new(2,3)
    boundry_coordinate = boundry_coordinate.new_coordinates_for(0, 1)
    expect("#{boundry_coordinate}").to eql("2,4")
  end

  it "Y are aecremented for negative value" do
    boundry_coordinate = Coordinates.new(2,3)
    boundry_coordinate = boundry_coordinate.new_coordinates_for(0, -1)
    expect("#{boundry_coordinate}").to eql("2,2")
  end

  it "Point with X coordinate within boundary are identified" do
    boundry_coordinate = Coordinates.new(5,5)
    internal_point = Coordinates.new(4,5)
    expect(boundry_coordinate.has_within_bounds?(internal_point)).to eql(true)
  end

  it "Point with Y coordinate within boundary are identified" do
    boundry_coordinate = Coordinates.new(5,5)
    internal_point = Coordinates.new(5,4)
    expect(boundry_coordinate.has_within_bounds?(internal_point)).to eql(true)
  end

  it "Points with X coordinate outside boundary are identified" do
    boundry_coordinate = Coordinates.new(5,5)
    external_point = Coordinates.new(8, 5)
    expect(boundry_coordinate.has_outside_bounds?(external_point)).to eql(true)
  end

  it "points with Y coordinate outside boundary are identified" do
    boundry_coordinate = Coordinates.new(5,5)
    external_point = Coordinates.new(5,8)
    expect(boundry_coordinate.has_outside_bounds?(external_point)).to eql(true)
  end

end