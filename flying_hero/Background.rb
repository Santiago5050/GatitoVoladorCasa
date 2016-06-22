require 'gosu'

  SCROLL_SPEED = 2

class Background

  def initialize
    @image = Gosu::Image.new('assets/images/background.jpg', tileable: true)
    @width = @image.width
    @x = 0
  end

  def draw
    @image.draw(@x,0,0)
    @image.draw(@x - @width, 0 , 0)
  end

  def scroll!
    @x -= SCROLL_SPEED
    @x %= @width
  end

end
