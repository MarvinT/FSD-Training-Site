Feature: Upload Prezis

	As an admin
	So that I can share prezis with volunteers
	I want to be able to upload prezis to a specific lesson

Background: lessons in database

 
 Given the following lessons exist:
  |title            |description       |release_date|
  |Lesson1          |the first lesson  |25-Nov-1992 |
  |Lesson2          |the second lesson |22-Mar-2012 |

 	
Scenario: upload document to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I enter the url for "Prezzie1"
  And  I press "submit"
  Then I should see "Prezzie1 successfully uploaded"
