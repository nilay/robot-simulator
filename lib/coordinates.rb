class Coordinates

  attr_accessor :x_coordinate, :y_coordinate

  def initialize (x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate.to_i
    @y_coordinate = y_coordinate.to_i
  end


  def new_coordinates_for(x_coordinate_step_value, y_coordinate_step_value)
    Coordinates.new((@x_coordinate + x_coordinate_step_value), (@y_coordinate + y_coordinate_step_value))
  end


  def to_s()
    "#{@x_coordinate},#{@y_coordinate}"
  end

  def has_within_bounds?(coordinates)
    is_x_coordinate_within_bounds?(coordinates.x_coordinate) && is_y_coordinate_within_bounds?(coordinates.y_coordinate)
  end

  def has_outside_bounds?(coordinates)
    is_x_coordinate_in_outside_bounds?(coordinates.x_coordinate) && is_y_coordinate_in_outside_bounds?(coordinates.y_coordinate)
  end

  def is_x_coordinate_in_outside_bounds?(x_coordinate)
    x_coordinate >= @x_coordinate
  end


  def is_y_coordinate_in_outside_bounds?(y_coordinate)
    y_coordinate >= @y_coordinate
  end

  def is_y_coordinate_within_bounds?(y_coordinate)
    y_coordinate <= @y_coordinate
  end

  def is_x_coordinate_within_bounds?(x_coordinate)
    x_coordinate <= @x_coordinate
  end

  def new_coordinates_for_step_size(x_coordinate_step_value, y_coordinate_step_value)
    Coordinates.new((@x_coordinate + x_coordinate_step_value), (@y_coordinate + y_coordinate_step_value))
  end
end