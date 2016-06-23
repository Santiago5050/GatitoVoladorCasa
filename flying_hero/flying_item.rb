require 'gosu'

class FlyingItem

  attr_accessor :collisionVer

  def initialize(window)
    @image = Gosu::Image.new(self.class.image_path)
    @width = @image.width
    @height = @image.height

    @y = Random.rand(window.height - @height)
    @x = window.width - 100
  end

  def draw
    @image.draw(@x, @y, 1, 1, 1) #
  end

  def collision(hero,window)
    if (@y >= hero.y) && ((@y + @height) <= (hero.y + hero.height))
      if (@x >= hero.x) && ((@x + @width) <= (hero.x + hero.width))
        @y = Random.rand(window.height - @height)
        @x = window.width - 100
        @collisionVer = true
        p 'colision'
        p @collisionVer
      end
    end
  end
end
