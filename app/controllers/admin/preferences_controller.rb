class Admin::PreferencesController < AdminController
  def edit
    @preferences = Preference.all
  end
  
  def update
    @preferences = Preference.update_many(params[:preferences])
    flash[:success] = "Preferences have been updated"
    redirect_to edit_admin_preferences_path
  end
end
