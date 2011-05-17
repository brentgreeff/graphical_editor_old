require 'spec_helper'
require 'lib/image'

describe Image do
  
  let(:image) { Image.new }
  
  context "with a width of 2 pixels" do
    before { image.width = 2 }
    
    context "and a height of 2 pixels" do
      before { image.height = 2 }
      
      it "should have a first row of FF" do
        image.row(1).should == "FF"
      end
      
      it "should have a second row of FF" do
        image.row(2).should == "FF"
      end
    end
    
    context "with an A coloured pixel placed at x-2 y-2" do
      before { image.plot(2, 2, 'A') }
      
      it "should return FF for the first row" do
        image.row(1).should == "FF"
      end
      
      it "should return FA for the second row" do
        image.row(2).should == "FA"
      end
      
      context "with a C coloured pixel placed at x-1, y-1" do
        before { image.plot(1, 1, 'C') }
        
        it "should return CF for the first row" do
          image.row(1).should == "CF"
        end
        
        it "should return FA for the second row" do
          image.row(2).should == "FA"
        end
        
        context "adding a point at the same location as an existing point" do
          before { image.plot(1, 1, 'B') }
          
          it "should return BF for the first row" do
            image.row(1).should == "BF"
          end
        end
      end
    end
  end
  
  context "with a width of 3 pixels" do
    before { image.width = 3 }
    
    it "should have a row 1 of 3 pixels" do
      image.row(1).should == "FFF"
    end
  end
end
