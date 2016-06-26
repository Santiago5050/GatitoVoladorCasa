require 'gosu'
require_relative 'flying_item'

class AsteroidBig < FlyingItem

  def self.image_path
    'assets/images/asteroid.png'
  end

  def changeImage
    @image.height += 1000
    @image.width += 1000
  end

  def self.name
    'AsteroidBig'
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
