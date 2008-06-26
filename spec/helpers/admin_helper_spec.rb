require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminHelper do
  include AdminHelper
  
  describe "#admin_page_title" do
    it "should return the correct response if there is no @page_title set" #do
      # @page_title = nil
      # admin_page_title.should eql("&raquo; Admin")
      # FIXME: How to test this in the new RSpec
    # end
    
    it "should return the correct response if there is a @page_title set"
  end
  
end
