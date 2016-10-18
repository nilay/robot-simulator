require_relative "lib/robot"
require_relative "lib/tabletop"

# Provide console environment so command can be tested


# create table top with 5 x 5 cells
robo = Robot.new(Tabletop.new(5,5))


puts "Type Command ('exit' to terminate)"
$stdin.each_line do |l|
  break if l.strip == "exit"
  begin
    robo.run(l.strip)
  rescue Exception => e
    puts "Error: #{e.message}"
  end
end

puts 'Bye'