require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::PreferencesController do
  fixtures :preferences

  # TODO: Make this part of a global admin_spec and use It Should Behave Like
  it "requires logging admin privallages" do
    get :edit
    response.should redirect_to(login_path)
  end

  describe "when logged in" do
    before(:each) do
      login_as :superman
    end
    
    describe "list action" do
      it "should get a collection of preferences" do
        get :edit
        assigns(:preferences).should_not be_empty
      end
    end
  
    describe "edit action" do
      it "should succesfully complete the action" do
        Preference.should_receive(:update_many).once.and_return(true)
        put :update, :preferences => { :name => "simple", :theme => "fuschia" }
        assigns(:preferences).should_not be_nil
        response.should be_redirect
      end
    end
  end
end
