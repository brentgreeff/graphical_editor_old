require 'spec_helper'
require 'lib/image'

describe Image do
  
  let(:image) { Image.new }
  
  context "with a width of 2 pixels" do
    before { image.width = 2 }
    
    context "and a height of 2 pixels" do
      before { image.height = 2 }
      
      it "should have a first row of 00" do
        image.row(1).should == "00"
      end
      
      it "should have a second row of 0" do
        image.row(2).should == "00"
      end
    end
    
    context "with an A coloured pixel placed at x-2 y-2" do
      before { image.plot(2, 2, 'A') }
      
      it "should return 0 for the first row" do
        image.row(1).should == "00"
      end
      
      it "should return 0A for the second row" do
        image.row(2).should == "0A"
      end
      
      context "with a C coloured pixel placed at x-1, y-1" do
        before { image.plot(1, 1, 'C') }
        
        it "should return C0 for the first row" do
          image.row(1).should == "C0"
        end
        
        it "should return 0A for the second row" do
          image.row(2).should == "0A"
        end
        
        context "adding a point at the same location as an existing point" do
          before { image.plot(1, 1, 'B') }
          
          it "should return B0 for the first row" do
            image.row(1).should == "B0"
          end
        end
      end
    end
  end
  
  context "with a width of 3 pixels" do
    before { image.width = 3 }
    
    it "should have a row 1 of 3 pixels" do
      image.row(1).should == "000"
    end
  end
end
