class MailchimpsController < ApplicationController
#require Gibbon
  def index
  end

  def create
    g = Gibbon.new("6c38afa20318ef3f858b1ba9d2e6f2d5-us5")
    g.throws_exceptions  = false
    list_id = g.lists({:filters => {:list_name => "Prerelease Signup"}})
  
    response = g.list_subscribe({:id => "9e2996659c",
                                  :email_address => params[:email],
                                  :double_optin => false,
                                  :send_welcome => true})

      if (response.is_a?(Hash))
        #&& response.has_key?("error")
          Rails.logger.info("MAILCHIMP RESPONSE: result #{response}")
          message_type = response.keys[0]
          message_detail = response['error']
          #Rails.logger.info("MESSAGE_TYPE: result #{message_type}")
          #Rails.logger.info("MESSAGE_DETAIL: result #{message_detail}")
          redirect_to root_path, :alert =>"#{message_detail}".html_safe
          #redirect_to root_path, message_type =>"This is a test"
          Rails.logger.info("LOGIC: Used the 'if'")
        else
          redirect_to root_path, :notice =>"Your Newsletter Subscription has been recieved!"
          Rails.logger.info("LOGIC: Used the 'else'")
        end  
        
    end
  end
 