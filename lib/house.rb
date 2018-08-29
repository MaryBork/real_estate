require 'pry'

class House
  attr_reader :address,
              :rooms


  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    price_formatted = @price.gsub(/\$/,'')
    price_formatted.to_i
  end

  def add_room(room)
    @rooms << room
  end


  def rooms_by_category(room_type)
    @rooms.find_all do |room|
      room_type == room.category
    end
  end

  def area
    sum = 0
    areas = @rooms.map do |room|
      room.length * room.width
    end

    areas.each do |num|
      sum += num
    end
    return sum
  end

  def price_per_square_foot
    square_price = price / (area ** 2)
    return square_price
  end

end
