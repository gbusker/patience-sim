require 'spec_helper.rb'
require 'column'

describe Column do
  
  describe "initialization" do
    
    before do
      @column = Column.new
    end
    
    it "has an empty closed stack" do
      @column.closed.empty?.should be_true
    end
    
    it "has an empty open stack" do
      @column.open.empty?.should be_true
    end

  end

  describe "core functions" do

    before do
      @column = Column.new
      @column.closed.push "CA"
      @column.closed.push "D0"
      @column.open.push "D3"
      @column.open.push "D7"
    end

    it "should report the closed count" do
      @column.closed.count.should == 2
    end
    it "should report the open count" do
      @column.closed.count.should == 2
    end
    it "should report the total count" do
      @column.count.should == 4
    end

    it "should output as a string" do
      @column.output_s.length.should > 5
    end


  end

end
