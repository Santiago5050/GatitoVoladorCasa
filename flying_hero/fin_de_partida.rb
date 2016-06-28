require 'gosu'
require_relative 'boton'

class FinPartida < Gosu::Window

  attr_accessor :option

  def initialize
    super(900,550, fullscreen: true)
    self.caption = 'Flying hero!'

    @titulo = Gosu::Image.from_text(self, "Game Over", Gosu.default_font_name, 150)
    @titulo_x = ((self.width / 2) - (@titulo.width / 2))
    @background = Gosu::Image.new('assets/images/background.jpg')
    @botonSalir = Boton.new(1, self, 'Salir')
    @botonReiniciar = Boton.new(2, self, 'Continuar')
    @selected = 0
    @option = 'Salir'
  end

  def draw

    @background.draw(0,0,0)
    @titulo.draw(@titulo_x, 10 , 2 )
    if @selected == 1
      @botonSalir.draw
      @botonReiniciar.selected
    elsif @selected == 0
      @botonSalir.selected
      @botonReiniciar.draw
    end
  end

  def button_down(id)
    if id == Gosu::KbUp && @selected == 1
      @selected = 0
      @option = 'Salir'
    elsif id == Gosu::KbUp && @selected == 0
      @selected = 1
      @option = 'Reiniciar'
    end
    if id == Gosu::KbDown && @selected == 1
      @selected = 0
      @option = 'Salir'
    elsif id == Gosu::KbDown && @selected == 0
      @selected = 1
      @option = 'Reiniciar'
    elsif id == Gosu::KbReturn
      self.close
    end
  end

  def update

  end
end
