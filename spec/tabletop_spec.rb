require "tabletop"
require "direction"

describe Tabletop do
  it "Location with coordinate within bounds is identified" do
    study_table = Tabletop.new(5,5)
    tabletop_coordinate = Coordinates.new(4,0)
    expect(study_table.has_within_bounds?(tabletop_coordinate)).to eql(true)
  end

  it "Location with positive X coordinate outside bounds is identified" do
    study_table = Tabletop.new(5,5)
    tabletop_coordinate = Coordinates.new(6,0)
    expect(study_table.has_within_bounds?(tabletop_coordinate)).to eql(false)
  end

  it "Location with negative X coordinate outside bounds is identified" do
    study_table = Tabletop.new(5,5)
    tabletop_coordinate = Coordinates.new(-1,0)
    expect(study_table.has_within_bounds?(tabletop_coordinate)).to eql(false)
  end

  it "Location with positive Y coordinate outside bounds is identified" do
    study_table = Tabletop.new(5,5)
    tabletop_coordinate = Coordinates.new(0,6)
    expect(study_table.has_within_bounds?(tabletop_coordinate)).to eql(false)
  end

  it "Location with negative Y coordinate outside bounds is identified" do
    study_table = Tabletop.new(5,5)
    tabletop_coordinate = Coordinates.new(0,-1)
    expect(study_table.has_within_bounds?(tabletop_coordinate)).to eql(false)
  end

end