require_relative 'coordinates'
class Tabletop


  def initialize(top_left_x_coordinate, bottom_right_y_coordinate)
    @top_left_coordinates = Coordinates.new(0, 0)
    @bottom_right_coordinates = Coordinates.new(top_left_x_coordinate - 1, bottom_right_y_coordinate - 1)
  end

  ##
  # determines if given coordinate fall within tabletop bound
  #
  def has_within_bounds?(coordinates)
    @top_left_coordinates.has_outside_bounds?(coordinates) && @bottom_right_coordinates.has_within_bounds?(coordinates)
  end
end