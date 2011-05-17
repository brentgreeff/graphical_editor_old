require 'spec_helper'
require 'lib/point'

describe Point do
  
  let(:point) { Point.new(1, 2, 'A') }
  
  it "should have a x value of 1" do
    point.x.should == 1
  end
  
  it "should have a y value of 2" do
    point.y.should == 2
  end
  
  it "should have a colour value of A" do
    point.colour.should == 'A'
  end
  
  context "with a color of A" do
    before { point.colour = 'A' }
    
    context "assiging a new colour" do
      before { point.colour = 'B' }
      
      it "should update the color" do
        point.colour.should == 'B'
      end
    end
  end
end
