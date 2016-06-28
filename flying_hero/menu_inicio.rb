require 'gosu'
require_relative 'boton'

class Menu < Gosu::Window

  attr_accessor :option

  def initialize
    super(900, 550, fullscreen: true)
    self.caption = 'Flying hero!'

    @song = Gosu::Song.new('assets/songs/background_song.ogg')
    @song.play(looping = true)

    @background = Gosu::Image.new('assets/images/menuBack.jpg')

    @botonNuevo = Boton.new(3, self, 'Nuevo_Juego')
    @botonPuntuacion = Boton.new(2, self, 'Puntuaciones')
    @botonSalir = Boton.new(1, self, 'Salir')

    @selected = 1
    @option = 'Nuevo_Juego'
  end

  def draw
    @background.draw(0,0,0)

    if @selected == 1
      @botonNuevo.selected
      @botonPuntuacion.draw
      @botonSalir.draw
    elsif @selected == 2

      @botonNuevo.draw
      @botonPuntuacion.draw
      @botonSalir.selected
    elsif @selected == 0
      @botonNuevo.draw
      @botonPuntuacion.selected
      @botonSalir.draw
    end
  end

  def button_down(id)
    if id == Gosu::KbUp && @selected == 2
      @selected = 0
      @option = 'Puntuaciones'
    elsif id == Gosu::KbUp && @selected == 0
      @selected = 1
      @option = 'Nuevo_Juego'
    elsif id == Gosu::KbUp && @selected == 1
      @selected = 2
      @option = 'Salir'
    end
    if id == Gosu::KbDown && @selected == 1
      @selected = 0
      @option = 'Puntuaciones'
    elsif id == Gosu::KbDown && @selected == 2
      @selected = 1
      @option = 'Nuevo_Juego'
    elsif id == Gosu::KbDown && @selected == 0
      @selected = 2
      @option = 'Salir'
    elsif id == Gosu::KbReturn
      self.close
    end
  end
end
