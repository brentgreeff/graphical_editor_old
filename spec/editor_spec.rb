require 'spec_helper'
require 'lib/editor'
require 'lib/image'

describe Editor do
  
  let(:editor) { Editor.new }
  
  it "should set the size of the image and clear it when calling with 'i'" do
    image = Image.new
    Image.should_receive(:new).and_return(image)
    
    image.should_receive(:width=).with(2)
    image.should_receive(:height=).with(3)
    
    editor.i(2, 3)
  end
  
  context "thats been initialized" do
    before { editor.i(2, 2) }
    
    it "should plot a point if 'l' is called" do
      editor.image.should_receive(:plot).with(2, 2, 'X')
      
      editor.l(2, 2, 'X')
    end
    
    it "should clear the image if 'c' is called" do
      editor.image.should_receive(:clear)
      
      editor.c
    end
    
    it "should show the image if 's' is called" do
      editor.image.should_receive(:show)
      
      editor.s
    end
    
    it "should draw a vertical line if v is called" do
      editor.image.should_receive(:vertical).with(3, 2, 4, 'E')
      
      editor.v(3, 2, 4, 'E')
    end
    
    it "should draw a horizontal line if h is called" do
      editor.image.should_receive(:horizontal).with(3, 4, 2, 'Z')
      
      editor.h(3, 4, 2, 'Z')
    end
  end
end
