class Admin::PreferencesController < AdminController
  def create
    update
  end
  
  def show
    edit
    render :action => "edit"
  end
  
  def edit
    @preferences = Preference.all.to_key_and_value_pair
  end
  
  def update
    Preference.update_many(params[:preferences])
    @preferences = Preference.all.to_key_and_value_pair
    flash[:success] = "Preferences have been updated"
    render :action => "edit"
  end
end
