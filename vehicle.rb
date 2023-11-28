# vechicle class
class Vehicle
  attr_accessor :registration_number, :color, :slot_number

  def initialize(registration_number, color, slot_number)
    self.registration_number = registration_number
    self.color = color.downcase
    self.slot_number = slot_number.to_i
  end
end
