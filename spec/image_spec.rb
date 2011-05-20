require 'spec_helper'
require 'lib/image'

describe Image do
  
  let(:image) { Image.new }
  
  context "with a width of 2 pixels" do
    before { image.width = 2 }
    
    context "and a height of 2 pixels" do
      before { image.height = 2 }
      
      it "should have a first row of OO" do
        image.row(1).should == "OO"
      end
      
      it "should have a second row of OO" do
        image.row(2).should == "OO"
      end
    end
    
    context "with an A coloured pixel placed at x-2 y-2" do
      before { image.plot(2, 2, 'A') }
      
      it "should return O for the first row" do
        image.row(1).should == "OO"
      end
      
      it "should return OA for the second row" do
        image.row(2).should == "OA"
      end
      
      context "with a C coloured pixel placed at x-1, y-1" do
        before { image.plot(1, 1, 'C') }
        
        it "should return CO for the first row" do
          image.row(1).should == "CO"
        end
        
        it "should return OA for the second row" do
          image.row(2).should == "OA"
        end
        
        context "adding a point at the same location as an existing point" do
          before { image.plot(1, 1, 'B') }
          
          it "should return BO for the first row" do
            image.row(1).should == "BO"
          end
        end
        
        context "clearing the image" do
          before { image.clear }
          
          it "should have a first row of OO" do
            image.row(1).should == "OO"
          end

          it "should have a second row of OO" do
            image.row(2).should == "OO"
          end
        end
      end
    end
  end
  
  context "with a width of 2 pixels" do
    before { image.width = 2 }
    
    context "and a height of 2 pixels" do
      before { image.height = 2 }
      
      it "should print as a 4x4 grid" do
        image.show.should == "OO\nOO"
      end
      
      context "with an A coloured pixel placed at x-2 y-2" do
        before { image.plot(2, 2, 'A') }
        
        it "should print as a 4x4 grid" do
          image.show.should == "OO\nOA"
        end
      end
    end
  end
  
  context "with a width of 3 pixels" do
    before { image.width = 3 }
    
    it "should have a row 1 of 3 pixels" do
      image.row(1).should == "OOO"
    end
  end
  
  context "with a width of 5 pixels" do
    before { image.width = 5 }
    
    context "and a height of 6 pixels" do
      before { image.height = 6 }
      
      context "with an A coloured pixel placed at x-2 y-3" do
        before { image.plot(2, 3, 'A') }
        
        it "should print as a 5x6 grid" do
          image.show.should == "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO"
        end
      end
    end
  end
end
