Feature: Upload Prezis

	As an admin
	So that I can share prezis with volunteers
	I want to be able to upload prezis to a specific lesson

  	
Scenario: upload document to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I fill in "upload_prezis" with "upload_prezis_path"
  And  I press "submit"
  Then I should see "upload_prezis_path"
