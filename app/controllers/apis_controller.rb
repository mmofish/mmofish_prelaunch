class ApisController < ApplicationController

def put
  
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "Prerelease Signup"
      info = { }
      email = params[:email]
      result = mailchimp.list_subscribe(list_id, email, info, 'html', false, true, false, true)
      Rails.logger.info("MAILCHIMP SUBSCRIBE: result #{result.inspect} for #{email}")
      redirect_to root_path, :notice =>"You have been subscribed to our notification list"
  
end

end