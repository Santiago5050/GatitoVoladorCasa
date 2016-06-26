require 'gosu'

class FlyingItem

  attr_accessor :collisionVer, :complete, :name

  def initialize(window)
    @image = Gosu::Image.new(self.class.image_path)
    @width = @image.width
    @height = @image.height
    @complete = false
    @y = Random.rand(window.height - @height)
    @x = window.width - 100
  end

  def draw(window)
    if self.class.name == 'AsteroidBig'
      @image.draw(@x, @y, 1, 2, 2)
    else
      @image.draw(@x, @y, 1, 1, 1) #
    end
  end

  def ready?(window)
    @collisionVer = false
    @y = Random.rand(window.height - @height)
    @x = window.width - 100
  end

  def collision(hero,window)
    if ((@y + (@height / 2)) >= (hero.y + (hero.height / 2)) && (@y + (@height / 2)) <= (hero.y + hero.height))
      if ((@x + @width) <= (hero.x + hero.width) && ((@x) > (hero.x)))
        @x = 0 - @width
        @collisionVer = true
      end
    elsif ((@y + (@height / 2)) < (hero.y + (hero.height / 2)) && (@y + (@height / 2)) >= (hero.y))
      if ((@x + @width) <= (hero.x + hero.width) && (@x) > (hero.x))
        @x = 0 - @width
        @collisionVer = true
      end
    end
  end
end
