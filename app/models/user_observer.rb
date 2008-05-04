class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_signup_success(user)
  end
end
