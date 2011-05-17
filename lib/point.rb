class Point
  
  attr_reader :x
  attr_reader :y
  attr_accessor :colour
  
  def initialize(x, y, colour)
    @x, @y, @colour = x, y, colour
  end
end
