require File.dirname(__FILE__) + '/../spec_helper'

describe DateTimeExtensions do
  describe "#ordanalized_day" do
    it "should add the correct suffix" do
      Time.parse("1 Jan").ordanalized_day.should  eql("1st")
      Time.parse("2 Jan").ordanalized_day.should  eql("2nd")
      Time.parse("30 Jan").ordanalized_day.should eql("30th")
    end
  end
  
  describe "#lowercase_ampm" do
    it "should output correctly" do
      Time.parse("01:00").lowercase_ampm.should eql("am")
      Time.parse("13:00").lowercase_ampm.should eql("pm")
    end
  end
  
  describe "#pretty_print" do
    it "should output the date and time correctly" do
      Time.parse("27 July 2008 15:01").pretty_print.should eql("3:01pm, 27th July 2008")
    end
  end
end
