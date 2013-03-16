class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :opt_in
  
  # Trigger the private methods below
  after_create :add_user_to_mailchimp unless Rails.env.test?
  before_destroy :remove_user_from_mailchimp unless Rails.env.test?


private

def add_user_to_mailchimp
    unless self.email.include?('@example.com') or !self.opt_in?
      g = Gibbon.new(ENV["MAILCHIMP_API_KEY"])
      g.throws_exceptions  = false
      list_id = g.lists({:filters => {:list_name => "Prerelease Signup"}})
      info = { }
      response = g.list_subscribe({:id => "9e2996659c",
                                  :email_address => self.email,
                                  :double_optin => false,
                                  :send_welcome => true})
      Rails.logger.info("MAILCHIMP SUBSCRIBE:  #{response}")
    end
  end
  

   
  def remove_user_from_mailchimp
    unless self.email.include?('@example.com')
      g = Gibbon.new(ENV["MAILCHIMP_API_KEY"])
      g.throws_exceptions  = false
      list_id = g.lists({:filters => {:list_name => "Prerelease Signup"}})
      response = g.list_unsubscribe({:id => "9e2996659c",
                                  :email_address => self.email,
                                  :delete_member => false,
                                  :send_goodbye => true,
                                  :send_notify => true})
      Rails.logger.info("MAILCHIMP UNSUBSCRIBE: #{response}")
    end
  end

  
end