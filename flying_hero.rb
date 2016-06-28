require_relative 'flying_hero/game'
require_relative 'flying_hero/fin_de_partida'
require_relative 'flying_hero/menu_inicio.rb'
require_relative 'flying_hero/end_game'

@endProgram = false

while @endProgram == false

  menu = Menu.new
  menu.show

  if menu.option == 'Nuevo_Juego'

    @reinicio = true

    while @reinicio
      game = Game.new
      game.show

      if game.estatus == 'lose'
        game_over = FinPartida.new
        game_over.show
        if game_over.option == 'Salir'
          @reinicio = false
        end

      elsif game.estatus == 'end_game'
        end_game = EndGame.new
        end_game.show
        if end_game.option == 'Salir'
          @reinicio = false
      end
    end
  end
  elsif menu.option == 'Salir'
    @endProgram = true
  end

end
