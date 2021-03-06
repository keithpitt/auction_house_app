class UserMailer < ActionMailer::Base

  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://auctionwhore.keithpitt.com/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://auctionwhore.keithpitt.com/"
  end
  
  protected

    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "admin@auctionwhore.keithpitt.com"
      @subject     = "AuctionWhore: "
      @sent_on     = Time.now
      @body[:user] = user
    end

end
