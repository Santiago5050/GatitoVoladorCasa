require 'gosu'
require_relative 'flying_item'

class Candy < FlyingItem

  def self.image_path
    'assets/images/candy.png'
  end

  def self.name
    'Candy'
  end

  def move!(window)
    if @x >= ( 0 - @width)
      @x -= 10
      if @x <= (0 - @width)
        @complete = true
      end
    end
  end
end
