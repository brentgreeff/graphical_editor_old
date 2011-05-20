class Editor
  
  attr_accessor :image
  
  def i(width, height)
    @image = Image.new
    
    @image.width = width.to_i
    @image.height = height.to_i
    nil
  end
  
  def l(x, y, colour)
    @image.plot(x.to_i, y.to_i, colour)
    nil
  end
  
  def v(x, y1, y2, colour)
    @image.vertical(x.to_i, y1.to_i, y2.to_i, colour)
    nil
  end
  
  def h(x1, x2, y, colour)
    @image.horizontal(x1.to_i, x2.to_i, y.to_i, colour)
    nil
  end
  
  def c
    @image.clear
    nil
  end
  
  def s
    @image.show
  end
  
  def method_missing(name, *args, &block)
    "#{name.to_s.upcase} - Unknown command"
  end
end
