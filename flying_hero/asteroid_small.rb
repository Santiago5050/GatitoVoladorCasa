require 'gosu'
require_relative 'flying_item'

class AsteroidSmall < FlyingItem

  def self.image_path
    'assets/images/asteroid.png'
  end

  def self.name
    'AsteroidSmall'
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
