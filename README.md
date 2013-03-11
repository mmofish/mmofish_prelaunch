# mmofish Prelaunch

This application is the holding page for the mmofish project.   

##Preferences:
{:git=>true, :railsapps=>"none", :dev_webserver=>"thin", :prod_webserver=>"thin", :database=>"sqlite", :templates=>"erb", :unit_test=>"rspec", :integration=>"cucumber", :fixtures=>"factory_girl", :frontend=>"bootstrap", :bootstrap=>"sass", :email=>"mandrill", :authentication=>"devise", :devise_modules=>"invitable", :authorization=>"cancan", :form_builder=>"simple_form", :starter_app=>"admin_app", :rvmrc=>false, :quiet_assets=>true, :local_env_file=>true, :better_errors=>true, :ban_spiders=>true}

## Ruby on Rails

This application requires:

* Ruby version 1.9.3
* Rails version 3.2.1

## Database

This application uses SQLite with ActiveRecord in development & test.
This application uses PostgreSQL with ActiveRecord in staging & production.

## Development

* Template Engine: ERB
* Testing Framework: RSpec and Factory Girl and Cucumber
* Front-end Framework: Twitter Bootstrap (Sass)
* Form Builder: SimpleForm
* Authentication: Devise
* Authorization: CanCan

## Email

The application is configured to send email using a Mandrill account.

## Credits

Based on a base implementation of rails composer.
Developed by Mizpah & Shinogi for mmofish

## Heroku

mmofish-production is deployed from the production branch.

## License

License details will be available on release.