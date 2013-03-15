class ApisController < ApplicationController

def put
  
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "Prerelease Signup"
      info = { }
      email = params[:email]
      result = mailchimp.list_subscribe(list_id, email, info, 'html', false, true, false, true)
       rescue Hominid::APIError => error
      #Rails.logger.info("MAILCHIMP SUBSCRIBE: result #{result.inspect} for #{email}")
      Rails.logger.info("MAILCHIMP SUBSCRIBE: result #{result}. Error: #{error.message}")
      redirect_to root_path, :notice =>"This is a test"
   
  
end

end