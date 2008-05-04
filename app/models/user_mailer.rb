class UserMailer < ActionMailer::Base
  def signup_success(user)
    setup_email(user)
    @subject    += 'Your account has been created!'
    @body[:url]  = "http://YOURSITE/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "ADMINEMAIL"
      @subject     = "[YOURSITE] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
