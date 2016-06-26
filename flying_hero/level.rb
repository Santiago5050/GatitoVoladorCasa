require 'gosu'


class Level

  attr_accessor :items

    def initialize
      @items = 2
    end

    def dificult(score)
      if (score % 1000) == 0
        @items += score / 1000
      end
    end
end
