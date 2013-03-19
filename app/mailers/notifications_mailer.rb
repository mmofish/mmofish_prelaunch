class NotificationsMailer < ActionMailer::Base
  default :from => "noreply@mmofish.com"
  #default :to => "martin@mmofish.com"
  default :to => "mizpah@enigmaguild.org"
  
  def new_message(message)
    @message = message
    mail(:subject => "[mmofish.com] #{message.subject}")
  end  
end
