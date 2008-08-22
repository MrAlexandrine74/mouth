class AdminController < ApplicationController
  before_filter :set_admin_flag
  before_filter :admin_required
  
  def set_admin_flag
    @admin = true
  end
end