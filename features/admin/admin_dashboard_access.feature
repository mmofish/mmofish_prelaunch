@WIP
Feature: Administrator Dashboard Access
  In order to perform administration activities
  An admin user
  Should be able to access the admin panel

  Background: Given that I am logged in
   
  Scenario: An admin user has access to admin link in toolbar
      Given I have administration rights
      When I visit the homepage
      Then I should see an admin link in the toolbar
     
  Scenario: An admin user can access the admin area
      Given I have administration rights
	  When I visit the admin area
	  Then I should see the admin dashboard

    Scenario: A normal user can not access the admin area
      Given I do not have administration rights
      When I visit the admin area
	  Then I should see an access denied message
	  And I should be redirected to the homepage
	  
          