# README

Original Repo: git@github.com:NicholasJacques/corkboard.git

Navigate into the Corkboard directory in your terminal

Run the following commands:

Bundle
(utilizing "gem install -----" for any missing gems)

rake db:create
rake db:migrate
rake db:seed

(*you might need to enter an additional migration file*)
(*first check to see if column radius is present in the pro_services table in the schema*)
(*if it is not...*)

class AddColumnToProService < ActiveRecord::Migration[5.0]
  def change
    add_column :pro_services, :radius, :string
  end
end


Open the project in text editor of your choice

----------------------------------------------------------------------------------

In text editor open 'SchemaXML.txt'

In your web browser navigate to: http://ondras.zarovi.cz/sql/demo/

Click Save/Load

Paste the contents of SchemaXML into the Input/Output text field and hit "Load XML"

----------------------------------------------------------------------------------

A few notes on the project:

The Pro model is a single table inheritance from the User. 

Pro_Services is utilized to deliniate the user type between a Requester(user) and Pro. 

In Pro_Services there is a SET data type in the schema diagram (array w/integer in the DB). This is a non-indexed, unique value only array type that we are using to store an array of the service id's that are essentially tags noting what services that professional provides.   

---------------------------------------------------------------------------------

Keys: 

Twilio

Facebook 

Google

----------------------------------------------------------------------------------

Rspec Test Suite
