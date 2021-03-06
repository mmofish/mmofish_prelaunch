class HomeController < ApplicationController
  
  #custom restful action - this may need a member route ?
  def index
 @message = Message.new
 #get me the last created git update ?
 @admin_git_updates = Admin::GitUpdate.order("created_at").last
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

end