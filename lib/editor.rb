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
  
  def c
    @image.clear
    nil
  end
  
  def s
    @image.show
  end
end
