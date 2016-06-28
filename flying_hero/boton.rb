require 'gosu'

class Boton
    def initialize(button, window, action)
      @action = action
      @image = Gosu::Image.new('assets/images/Menu/' + @action +'SS.png')
      @x = (window.width / 2) - (@image.width / 2)
      @y = window.height - ((@image.height * button) + (button * 5))
    end

    def draw
      @image = Gosu::Image.new('assets/images/Menu/' + @action +'SS.png')
      @image.draw(@x, @y, 1)
    end

    def selected
      @image = Gosu::Image.new('assets/images/Menu/' + @action +'CS.png')
      @image.draw(@x, @y, 1, 1, 1)
    end
end
