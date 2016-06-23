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
    if ((@y + (@height / 2)) >= (hero.y + (hero.height / 2)) && (@y + (@height / 2)) <= (hero.y + hero.height))
      if ((@x + @width) <= (hero.x + hero.width))
        @y = Random.rand(window.height - @height)
        @x = window.width - 100
        @collisionVer = true
      end
    elsif ((@y + (@height / 2)) < (hero.y + (hero.height / 2)) && (@y + (@height / 2)) >= (hero.y))
      if ((@x + @width) <= (hero.x + hero.width))
        @y = Random.rand(window.height - @height)
        @x = window.width - 100
        @collisionVer = true
      end
    end
  end
end
