require "byebug"
require_relative "room"

class Hotel

  attr_accessor :rooms
  
  def initialize(name, input_rooms)
    @name = name
    @rooms = {}; input_rooms.each { |k,v| @rooms[k] = Room.new(v) }
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def room_exists?(room_name)
    self.rooms[room_name] ? true : false
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      success = self.rooms[room_name].add_occupant(person)
      if success 
        p "check in successful"
      else
        p "sorry, room is full"
      end
    else
      p "sorry, room does not exist"
    end
  end

  def has_vacancy?
    rooms.values.any? { |room| room.occupants.count < room.capacity }
  end

  def list_rooms
    self.rooms.each do |name, room| 
      puts "#{name} : #{room.available_space}"
    end
  end

end
