def new_user
  @user ||= {:email => "example@example.com"}
end

def join_mailing_list user
  visit root_path
  fill_in "email", :with => user[:email]
  click_button "Subscribe"
end

When /^I visit the home page$/ do
  visit root_path
end

Then /^I should see a button "([^\"]*)"$/ do |arg1|
  page.should have_button (arg1)
end

Then /^I should see a form with a field "([^"]*)"$/ do |arg1|
  page.should have_content (arg1)
end

Then /^I should see a message "([^"]*)"$/ do |arg1|
  page.should have_content (arg1)
end

When /^I request to join the mailing list with with a vailid unique email address$/ do
  join_mailing_list new_user
end

When /^I request to join the mailing list with an invalid email address$/ do
  user = new_user.merge(:email => "notanemail")
  join_mailing_list user
end

When /^I request to join the mailing list with an existing user account email address$/ do
  user = new_user.merge(:email => "admin@mmofish.com")
  join_mailing_list user
end

When /^When I request to join the mailing list with an existing subscribed email address$/ do
  user = new_user.merge(:email => "subscribeduser@mmofish.com")
  join_mailing_list user
end

Then /^I should be added to the mailchimp list$/ do
  #I have no idea how to check this from here!
  #Do I have access to hominid from here ? Can I make a helper method to check if an email is subbed ? 
  #Or, is it enough to look for a positive responce ?
  #Actually this is going to be tricky, as I cant keep adding the same user else it will already be subscribed!
end

And /^it is not associated with a user account$/ do
  #Work out how to do this
  #guessing there must be a pretty standard test for if account exists - findbyemail ?
end

Then /^I should be prompted to log-in$/ do
  #Work out how to do this
  #Possibly just direct to the profile page show controller, think it will prompt for login by default
  
end

Then /^I should be redirected to my profile preferences$/ do
  #Work out how to do this
  #this may be handled inately from redirected out of the controller ?
end     