module SessionsHelper
  def user_signed_in?
  	   # Returns true if the user is logged in, false otherwise.
       !current_user.nil?
  end
end
