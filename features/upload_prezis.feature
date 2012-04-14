Feature: Upload Prezis

	As an admin
	So that I can share prezis with volunteers
	I want to be able to upload prezis to a specific lesson

Background: lessons in database

 Given the following lessons exist:
 
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |

 	
Scenario: upload a valid prezi to an existing lesson
  Given I am on the detail page for "Lesson1"
  And I follow "Upload Prezi"
  And  I upload "http://prezi.com/2ge5bhookyep/welcome-to-fsd-international/" as my prezi
  And  I press "Upload Prezi"
  Then I should be on the detail page for "Lesson1"
  And I should see "Prezi successfully uploaded"

Scenario: upload an invalid Prezi url to an existing lesson
  Given I am on the detail page for "Lesson1"
  And I follow "Upload Prezi"
  And I upload "http://www.gobbeldygook.gov" as my prezi
  And I press "Upload Prezi"
  Then I should see "Sorry, your URL was invalid. Please enter a valid URL."

@javascript
Scenario: delete a prezi from a lesson
  Given I am on the detail page for "Lesson1"
  And I follow "Upload Prezi"
  And I upload "http://prezi.com/2ge5bhookyep/welcome-to-fsd-international/" as my prezi
  And I press "Upload Prezi"
  Then I should be on the detail page for "Lesson1"
  And I follow "Delete Prezi"
  And I press "OK" on the pop up
  Then I should be on the detail page for "Lesson1"
  Then I should see "You have deleted a prezi for this lesson."
  
