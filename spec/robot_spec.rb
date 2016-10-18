require "robot"
require "tabletop"

describe Robot do

  it "Can throw exception on invalid command" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,EAST')
    begin
      robot.run('invalid command')
    rescue Exception => e
      excpetion_message = e.message
    end

    expect(excpetion_message).to eql('Invalid command')

  end

  it "Can throw exception if PLACE command has not been called earlier" do
    robot = Robot.new(Tabletop.new(5,5))
    begin
      robot.run('MOVE')
    rescue Exception => e
      excpetion_message = e.message
    end

    expect(excpetion_message).to eql("'PLACE' command has not been called earlier")

  end


  it "Can provide current location as string" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,NORTH')
    expect(robot.current_location()).to eql("0,0,NORTH")
  end

  it "Can rotate left" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,EAST')
    robot.run('LEFT')
    expect(robot.current_location()).to eql("0,0,NORTH")
  end

  it "Can rotate right" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,EAST')
    robot.run('RIGHT')
    expect(robot.current_location()).to eql("0,0,SOUTH")
  end

  it "Can move" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,EAST')
    robot.run('MOVE')
    expect(robot.current_location()).to eql("1,0,EAST")
  end


  it "Can execute susequent command" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,EAST')
    robot.run('MOVE')
    robot.run('LEFT')
    expect(robot.current_location()).to eql("1,0,NORTH")
  end


  it "Wont go off tabletop" do
    robot = Robot.new(Tabletop.new(5,5))
    robot.run('PLACE 0,0,EAST')
    robot.run('MOVE')
    robot.run('MOVE')
    robot.run('MOVE')
    robot.run('MOVE')
    robot.run('MOVE')
    robot.run('MOVE')
    expect(robot.current_location()).to eql("4,0,EAST")
  end

end
