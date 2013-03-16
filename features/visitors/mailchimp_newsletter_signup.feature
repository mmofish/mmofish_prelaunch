	Feature: Mailchimp Newsletter Signup
  	As a visitor to the website
  	I want to see an email signup form
  	so I can choose join the mailing list

  	Background:
    	Given I am not logged in
      
	Scenario: User views home page
    	When I visit the home page
    	Then I should see a button "Signup"
    	
    Scenario: User views subscription request form
    	When I visit the home page
    	Then I should see a form with a field "email"

	Scenario: User signs up with valid unique email address
		When I request to join the mailing list with a valid unique email address
		Then I should be added to the mailchimp list
		And I should see a message "Your Newsletter Subscription has been received"
      
	Scenario: User signs up with an invalid email address
		When I request to join the mailing list with an invalid email address
		Then I should see a message "Invalid Email Address"
		
	Scenario: User signs up with a existing user account email
		When I request to join the mailing list with an existing user account email address
		Then I should see a message "You already have an account!"
		And I should be prompted to log-in
		Then I should be redirected to my profile preferences
      
     Scenario: User signs up with a existing subscribed email
		When I request to join the mailing list with an existing subscribed email address
		And it is not associated with a user account
		Then I should see a message "is already subscribed to list"

       