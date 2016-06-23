require 'gosu'

class Score

  def initialize
    @score = 0
    @image = Gosu::Image.from_text(self,"Score: #{@score}" , Gosu.default_font_name , 30)
  end

  def draw
    @image.draw(0,0,2)
  end

  def count(verificacion, type)
    if (verificacion == true && type == "Candy")
      p 'candy ok'
      @score += 20
    elsif (verificacion == true && type == 'AsteroidSmall')
      @score -= 10
    elsif (verificacion == true && type == 'AsteroidBig')
      @score -= 20
    elsif (verificacion == true && type == 'AsteroidFixed')
      @score -= 30
    end
  end

end
