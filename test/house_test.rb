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

    assert_equal "123 sugar lane"
  end


  def test_it_has__no_rooms_by_default
    house = House.new("$400000", "123 sugar lane")

    assert_equal ([]), house.rooms
  end

end
