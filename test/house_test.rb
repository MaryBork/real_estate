require 'minitest/autorun'
require 'minitest/pride'
require './lib/room.rb'
require './lib/house.rb'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_price
    house = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price
  end

  def test_it_has_address
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end


  def test_it_has__no_rooms_by_default
    house = House.new("$400000", "123 sugar lane")

    assert_equal ([]), house.rooms
  end

  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)

    assert_equal house.rooms, house.add_room(room_1)
    assert_equal house.rooms, house.add_room(room_2)
    assert_equal 2, house.rooms.count
  end

  def test_it_can_categorize_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal ([room_1, room_2]), house.rooms_by_category(:bedroom)
    assert_equal ([room_4]), house.rooms_by_category(:basement)
  end

  def test_house_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
end

  # def test_price_by_square_foot
  #   house = House.new("$400000", "123 sugar lane")
  #   room_1 = Room.new(:bedroom, 10, 13)
  #   room_2 = Room.new(:bedroom, 11, 15)
  #   room_3 = Room.new(:living_room, 25, 15)
  #   room_4 = Room.new(:basement, 30, 41)
  #   house.add_room(room_1)
  #   house.add_room(room_2)
  #   house.add_room(room_3)
  #   house.add_room(room_4)
  #
  #   assert_equal 210.53, house.price_per_square_foot
  # end 
end
