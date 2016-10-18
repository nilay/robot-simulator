require "direction"

describe Direction do
  it "West is on left of North" do
    direction = Direction.new('NORTH')
    direction.turn_left
    expect("#{direction}").to eql("WEST")
  end

  it "East is on right of North" do
    direction = Direction.new('NORTH')
    direction.turn_right
    expect("#{direction}").to eql("EAST")
  end

  it "North is on right of West" do
    direction = Direction.new('WEST')
    direction.turn_right
    expect("#{direction}").to eql("NORTH")
  end

  it "South is on left of west" do
    direction = Direction.new('WEST')
    direction.turn_left
    expect("#{direction}").to eql("SOUTH")
  end


  it "East is on left of South" do
    direction = Direction.new('SOUTH')
    direction.turn_left
    expect("#{direction}").to eql("EAST")
  end

  it "West is on right of south" do
    direction = Direction.new('SOUTH')
    direction.turn_right
    expect("#{direction}").to eql("WEST")
  end

  it "North is on left of East" do
    direction = Direction.new('EAST')
    direction.turn_left
    expect("#{direction}").to eql("NORTH")
  end

  it "South is on right of east" do
    direction = Direction.new('EAST')
    direction.turn_right
    expect("#{direction}").to eql("SOUTH")
  end

  it "East is one step forward on X axis" do
    direction = Direction.new('EAST')
    expect(direction.step_size_for_x_axis).to eql(1)
  end


  it "East is stationary on Y axis" do
    direction = Direction.new('EAST')
    expect(direction.step_size_for_y_axis).to eql(0)
  end

  it "West is one step back on X axis" do
    direction = Direction.new('WEST')
    expect(direction.step_size_for_x_axis).to eql(-1)
  end

  it "West is stationary on Y axis" do
    direction = Direction.new('WEST')
    expect(direction.step_size_for_y_axis).to eql(0)
  end

  it "North is one step forward on Y axis" do
    direction = Direction.new('NORTH')
    expect(direction.step_size_for_y_axis).to eql(1)
  end

  it "North is stationary on X axis" do
    direction = Direction.new('NORTH')
    expect(direction.step_size_for_x_axis).to eql(0)
  end

  it "South is one step back on Y axis" do
    direction = Direction.new('SOUTH')
    expect(direction.step_size_for_y_axis).to eql(-1)
  end

  it "South is stationary on X axis" do
    direction = Direction.new('SOUTH')
    expect(direction.step_size_for_x_axis).to eql(0)
  end


end
