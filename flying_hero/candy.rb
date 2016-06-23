require 'gosu'
require_relative 'flying_item'

class Candy < FlyingItem

  def self.image_path
    'assets/images/candy.png'
  end

  def move!(window)
    if @x > 0
      @x -= 10
    else
      @x = window.width - 100
      @y = Random.rand(window.height - @height)
    end

  end
end
