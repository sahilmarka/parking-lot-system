# frozen_string_literal: true

require_relative 'parking_lot'

@parking_lot = nil
def execute_input_command(input)
  user_commands = input.split(' ')
  case user_commands[0].downcase
  when 'create_parking_lot'
    @parking_lot = ParkingLot.new(user_commands[1])
  when 'park'
    @parking_lot.add_vehicle_to_parking_lot(user_commands[1], user_commands[2])
  when 'leave'
    @parking_lot.leave_vehicle(user_commands[1].to_i)
  when 'status'
    @parking_lot.avaiable_vehicles
  when 'registration_numbers_for_cars_with_colour'
    @parking_lot.registration_numbers_for_cars_with_colour(user_commands[1])
  when 'slot_numbers_for_cars_with_colour'
    @parking_lot.slot_numbers_for_cars_with_colour(user_commands[1])
  when 'slot_number_for_registration_number'
    @parking_lot.slot_number_for_registration_number(user_commands[1])
  end
end

if ARGV.length == 1
  # Read input from the file
  filename = ARGV[0]
  input_data = File.readlines(filename)
  puts "Processing input from file: #{filename}"
  input_data.map(&:chomp).each do |input|
    next if input.empty?

    execute_input_command(input)
  end
  # execute_input(input_data)
else
  loop do
    input = gets.chomp
    break if input == 'close'

    execute_input_command(input)
  end
end