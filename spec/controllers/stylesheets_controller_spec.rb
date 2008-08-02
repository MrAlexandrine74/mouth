require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StylesheetsController do

  it "should have a valid route" do
    route_for(:controller => "stylesheets", :action => "show", :id => "mouth").should == "/stylesheets/mouth.css"
  end
  
  it "should serve stylesheets up" do
    get :show, :id => "mouth"
    response.should be_success
  end
  
  it "should have the correct mime/type" do
    get :show, :id => "mouth"
    response.content_type.should == 'text/css'
  end
  
  it "should return css" do
    get :show, :id => "mouth"
    response.body.should =~ %r(body \{)
  end
  
  it "should return the correct css" do
    get :show, :id => "mouth"
    response.body.should =~ %r(NOTE: this is the test stylesheet. Please do not delete it if you would like your test's to run.)
  end

end
