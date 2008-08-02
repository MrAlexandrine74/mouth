require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StylesheetsController do

  it "should have a valid route" do
    route_for(:controller => "stylesheets", :action => "show", :id => "mouth").should == "/stylesheets/mouth.css"
  end
  
  it "should serve stylesheets up"
  it "should have the correct mime/type"

end
