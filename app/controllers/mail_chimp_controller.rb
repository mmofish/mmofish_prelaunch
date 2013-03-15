class MailchimpController < ApplicationController
#This will be a test of using mc official and gibbon
#I really dont seem to be able to get stuff (response codes) out of hominid!

def subscribe
#Subscribe the user
m = :api
l = :list

end

def unsubscribe
#Unsubscribe the user  
end
  

def edituser
#Edit the subscription status
end


def exportuser
#do somthing to export users
end 

def importusers
#do somthing to import users
end
   
private

def mailchimp_toggle
# work out if user is currently subbed/unsubbed and flip the status
end


def api
api = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
end

def list_id
:api
end

def create_user_record_in_mailchimp
MailChimp.add_user(self)
end

       
def put
  
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "Prerelease Signup"
      info = { }
      email = params[:email]
      rescue = Hominid::APIError => error
      
      result = mailchimp.list_subscribe(list_id, email, info, 'html', false, true, false, true)
      Rails.logger.info("MAILCHIMP SUBSCRIBE: result #{result.inspect}")
      #Rails.logger.info("MAILCHIMP SUBSCRIBE: result #{result.body}")
      redirect_to root_path, :notice =>"You have been subscribed to our notification list"
   
  
end
end