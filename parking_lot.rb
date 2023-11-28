require_relative 'vehicle'

# parking lot class
class ParkingLot
  attr_accessor :vehicles, :parking_size

  def initialize(parking_size)
    self.parking_size = parking_size.to_i
    self.vehicles = Array.new(parking_size.to_i)
    puts "Created a parking lot with #{parking_size} slots"
  end

  # hoping every car will have reg_number and color
  def add_vehicle_to_parking_lot(registration_number, color)
    if vehicles.compact.size == parking_size
      puts 'Sorry, parking lot is full'
      return
    end

    slot_number = available_slot + 1
    vehicles[available_slot] = Vehicle.new(registration_number, color, slot_number)
    puts "Allocated slot number: #{slot_number}"
  end

  def available_slot
    vehicles.find_index(nil).to_i
  end

  def leave_vehicle(slot_number)
    if slot_number > parking_size || vehicles[slot_number].nil?
      puts 'Not found'
      return
    end

    vehicles[slot_number - 1] = nil
    puts "Slot number #{slot_number} is free"
  end

  def avaiable_vehicles
    puts 'Slot no.  Registration no.  Color'

    vehicles.compact.each do |vehicle|
      puts "   #{vehicle.slot_number}       #{vehicle.registration_number}    #{vehicle.color}"
    end
  end

  def registration_numbers_for_cars_with_colour(color)
    filtered_vehicles = filter_vehicles_by(color)
    if filtered_vehicles.empty?
      puts 'Not Found'
      return
    end

    print "#{filtered_vehicles.map(&:registration_number).join(', ')}\n"
  end

  def slot_numbers_for_cars_with_colour(color)
    filtered_vehicles = filter_vehicles_by(color)
    if filtered_vehicles.empty?
      puts 'Not Found'
      return
    end
    print "#{filtered_vehicles.map(&:slot_number).join(', ')}\n"
  end

  def filter_vehicles_by(color)
    vehicles.select { |vehicle| vehicle.color == color.downcase }
  end

  def slot_number_for_registration_number(reg_number)
    vehicle = vehicles.find { |vehicle| vehicle.registration_number.downcase == reg_number.downcase }
    if vehicle.nil?
      puts 'Not Found'
      return
    end

    puts vehicle.slot_number
  end
end
