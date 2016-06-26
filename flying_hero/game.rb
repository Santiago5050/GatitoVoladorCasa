require_relative 'Background'
require_relative 'Hero'
require_relative 'candy'
require_relative 'score'
require_relative 'level'
require_relative 'asteroid_small'
require_relative 'asteroid_big'

require 'gosu'

class Game < Gosu::Window
  def initialize
    super(900, 550, fullscreen: false)

    self.caption = 'Flying hero!'
    @background = Background.new
    @hero = Hero.new
    @candy = Candy.new(self)
    @score = Score.new
    @asteroid_small = AsteroidSmall.new(self)
    @level = Level.new
    @asteroid_big = AsteroidBig.new(self)
    @new = 1
    @fly_item = @candy
  end



  def draw
    if @new == 1 || (@fly_item.complete == true)

      if @new == 1
        @new = 0
      end

      number = Random.rand(4)

      p number
      if (number ==  0 || number == 3)
        @fly_item = @candy
        @fly_item.ready?(self)
        @fly_item.complete = false
      elsif number == 1
        @fly_item = @asteroid_small
        @fly_item.ready?(self)
        @fly_item.complete = false
      elsif number == 2
        @fly_item = @asteroid_big
        @fly_item.ready?(self)
        @fly_item.complete = false
      end
    end

    @fly_item.draw(self)

    @background.draw
    @hero.draw
    @score.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def update
    @background.scroll! #Movimiento del background

    #Movimiento del Heroe
    if button_down?(Gosu::KbUp)
      @hero.move_up!
    elsif button_down?(Gosu::KbDown)
      @hero.move_down!(height) #height = alto de la pantalla (Gosu::Window)
    end


    @fly_item.move!(self) #Movimiento del objeto volador

    @fly_item.collision(@hero, self) #Colision con el Heroe

     if @fly_item.collisionVer == true #Si el objeto colisiona con el Heroe
       @score.count(true, @fly_item.class.name) #Se cuenta en el score
       @fly_item.collisionVer = false
     end

    end
end
