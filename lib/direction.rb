class Direction
  NORTH = 1
  EAST = 2
  SOUTH = 3
  WEST = 4


  def initialize(current_direction)
    current_direction = current_direction.upcase
    raise 'Invalid direction' unless self.class.const_defined? current_direction

    @current_direction = self.class.const_get(current_direction)
  end

  ##
  # set direction based on left turn
  #
  def turn_left
    @current_direction = @current_direction ==1 ? 4 : @current_direction - 1
  end

  ##
  # set direction based on right turn
  #
  def turn_right
    @current_direction = @current_direction ==4 ? 1 : @current_direction + 1
  end

  def to_s
    ['NORTH', 'EAST', 'SOUTH', 'WEST'][@current_direction-1]
  end

  ##
  # Determine x step based on direction
  #
  def step_size_for_x_axis
    if [NORTH, SOUTH].include?(@current_direction)
      0
    elsif EAST == @current_direction
      1
    else
      -1
    end
  end

  ##
  # Determine y step based on direction
  #
  def step_size_for_y_axis
    if [EAST, WEST].include?(@current_direction)
      0
    elsif NORTH == @current_direction
      1
    else
      -1
    end

  end


end