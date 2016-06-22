require 'gosu'
require_relative 'flying_item'

class Candy < FlyingItem

  def self.image_path
    'assets/images/candy.png'
  end

  def move!
    if @x > 0
      @x -= 10
    else
      @x = @win - 100
    end

  end
end
