class Image
  
  attr_writer :width
  attr_writer :height
  
  def initialize
    clear
  end
  
  def row(y)
    line = ''
    
    1.upto(@width) do |x|
      line << get_colour(x, y)
    end
    line
  end
  
  def plot(x, y, colour)
    existing = point_at(x, y)
    
    if existing
      existing.colour = colour
    else
      @points << Point.new(x, y, colour)
    end
  end
  
  def vertical(x, y1, y2, colour)
    (y1..y2).each { |y| plot(x, y, colour) }
  end
  
  def show
    result = ''
    
    1.upto(@height) do |num|
      result << "#{row(num)}"
      result << "\n" unless num == @height
    end
    result
  end
  
  def clear
    @points = []
  end
  
  private
  
  def point_at(x, y)
    for point in @points
      return point if (point.x == x and point.y == y)
    end
    nil
  end
  
  def get_colour(x, y)
    existing = point_at(x, y)
    
    if existing
      existing.colour
    else
      "O"
    end
  end
end
