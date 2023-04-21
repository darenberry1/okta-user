# Okta user provisioning and deprovisioning PowerShell scripts
H2 There are 2 scripts, one to create the user and the other to deactive the user.

Author       : Daren Berry 
Contact      : Darenberry(at)gmail.com 

Script Names  : createOktaUser.ps1 & deactivateOktaUser.ps1

# Script Configuration

createOktaUser.ps1
There are 5 variables for the script that must be entered when the script is run.

	. $apiKey - A temporary token issed upon request. from the admin page in the okta portal.
	. $firstName - firstname of the user
	. $lastName - lastname of the user
	. $password - a password
	. $email - the users email address

deactivateOktaUser.ps1
There are 2 variables fore the script that must be entered when the script is run.
	
	. $apiKey - A temporary token issed upon request. from the admin page in the okta portal.
	. $email - the users email address
