Feature: Create or Delete a Lesson

	As an admin
	So that I can organize documetns, videos, and prezzies into lessons
	I want to be able to create or delete a lesson

Background: lessons in database

  Given the following lessons exist:
  
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  
Scenario: create a lesson  	
  When I am on the FSD-Training-Site home page
  And I follow "Create Lesson"
  Then I should be on the create page
  And I fill in "Title" with "Lesson3"
  And I press "Save Changes"
  Then I should be on the FSD-Training-Site home page
  And I should see "Lesson3"

Scenario: try to create a lesson without a title
  When I am on the FSD-Training-Site home page
  And I follow "Create Lesson"
  Then I should be on the create page
  And I press "Save Changes"
  Then I should see "You must enter a title for lesson."
  And I should be on the create page

@javascript 
Scenario: delete a lesson
  When I am on the details page for "Lesson1"
  And I follow "Delete Lesson"
  And I press "OK" on the pop up
  Then I should be on the FSD-Training-Site home page
  And I should not see "Lesson1"
