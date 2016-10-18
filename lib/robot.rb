require_relative 'coordinates'
require_relative 'direction'
class Robot
  COMMAND = {
      "LEFT" => :turn_left,
      "RIGHT" => :turn_right,
      "MOVE" => :move,
      "PLACE" => :place,
      "REPORT" => :report

  }

  def initialize (table_top)
    @placed = false
    @table_top = table_top
  end

  def place(coordinate, direction)

    raise "Out of Tabletop coordinate" unless @table_top.has_within_bounds?(coordinate)

    @position = coordinate
    @direction = direction

    # robot has been placed successfully on tabletop
    @placed = true
  end

  ##
  # parse command from console and execute it
  #
  def run(command_string)

    command, param1, param2, param3 = command_string.strip().gsub(' ', ',').squeeze(',').upcase().split(',')


    # raise exception if 'PLACE' command has not been called earlier
    raise "'PLACE' command has not been called earlier" unless @placed or command == 'PLACE'


    # blank or invalid command
    raise 'Invalid command' unless COMMAND.key?(command)

    if command == 'PLACE'
      # PLACE command should have three parameters attached
      raise 'Missing parameter' unless (param1 and param2 and param3)

      place(Coordinates.new(param1, param2),  Direction.new(param3))

    else
      self.public_send(COMMAND[command])
    end
  end

  ## print current position and direction of robot
  def report
    puts current_location
  end

  def current_location
    "#{@position},#{@direction}"
  end


  ##
  # Move robot to forward direction
  #
  def move
    position_after_move = @position.new_coordinates_for_step_size(@direction.step_size_for_x_axis, @direction.step_size_for_y_axis)

    #ignore the command if robot is being out off tabletop
    if(@table_top.has_within_bounds?(position_after_move))
      @position = @position.new_coordinates_for(@direction.step_size_for_x_axis, @direction.step_size_for_y_axis)

    end
  end

  def turn_left
    @direction.turn_left

  end

  def turn_right
    @direction.turn_right
  end
end