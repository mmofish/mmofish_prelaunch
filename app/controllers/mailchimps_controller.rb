class MailchimpsController < ApplicationController
#require Gibbon
  def index
  end

  def create
      # Check if we already have a user with this email registered.
      # If we do, we want to manage sub via profile instead.
    if (user = User.where(email: params[:email]).first)
      Rails.logger.info("USER: #{user}")
    redirect_to(root_path, alert: "You already have an account! "\
                                  "Please Log In to change your email preferences")
    return
    else
      Rails.logger.info("USER: This user does not exist")
    end
    
    # This idea, not working.
    # set_mailchimp_values 
    # g = Gibbon.new.(mailchimp_key)#currently this syntax is wrong for using the value set in the above method.
    
    g = Gibbon.new(ENV["MAILCHIMP_API_KEY"])
    g.throws_exceptions  = false
    
    #eventually this line shoudl be replaced by logic in set_mailchimp_values, and settings in the admin panel
    list_id = g.lists({:filters => {:list_name => "Prerelease Signup"}})
  
    # all that I want here is mailchimp.list_subscribe(:email_address) to use defaults, or extra params to change optin, list etc
    response = g.list_subscribe({:id => "9e2996659c",
                                  :email_address => params[:email],
                                  :double_optin => false,
                                  :send_welcome => true})

    if (response.is_a?(Hash))
      message_type = response.keys[0] #Rails.logger.info("MESSAGE_TYPE: result #{message_type}")
      message_detail = response['error'] #Rails.logger.info("MESSAGE_DETAIL: result #{message_detail}")
      redirect_to root_path, :alert =>"#{message_detail}".html_safe
    else
      redirect_to root_path, :notice =>"Your Newsletter Subscription has been received."\
                                       "Please check your email for you confirmation."
    end  
        
  end
    
    private
    
    # attempt at a private method only available within the controller.
    def set_mailchimp_values #Does this work ? No!
           @mailchimp_key = (ENV["MAILCHIMP_API_KEY"])
    end
    
end
 