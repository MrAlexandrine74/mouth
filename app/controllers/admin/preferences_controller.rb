class Admin::PreferencesController < AdminController
  def index
    @preferences = Preference.all
  end
  
  def edit
    @preference = Preference.find_by_name(params[:id])
  end
  
  def update
    @preference = Preference.find_by_name(params[:id])
    @preference.update_attribute('value', params[:value])
    flash[:success] = "You have succesfully updated the preference"
    redirect_to edit_admin_preference_path(params[:id])
  end
end
