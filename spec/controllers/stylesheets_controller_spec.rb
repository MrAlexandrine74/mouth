require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StylesheetsController do

  before(:each) do
    mock("pref", { :theme => "test" }) # Set the theme to the test themes
  end

  it "should have a valid route" do
    route_for(:controller => "stylesheets", :action => "show", :id => "mouth").should == "/stylesheets/mouth.css"
  end
  
  it "should serve stylesheets up" do
    get :show, :id => "mouth"
    response.should be_success
  end
  
  it "should have the correct mime/type"

end
