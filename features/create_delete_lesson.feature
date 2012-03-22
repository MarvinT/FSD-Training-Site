Feature: Create or Delete a Lesson

	As an admin
	So that I can organize documetns, videos, and prezzies into lessons
	I want to be able to create or delete a lesson

Background: lessons in database

  Given the following lessons exist:
  | title      | release_date |
  | Lesson1    |   2012-01-15 |
  | Lesson2    |   2012-02-15 |
  
Scenario: create a lesson  	
  When I am on the FSD-Training-Site home page
  And I follow "create"
  And I should be on the create page
  And I fill in "Title" with "Lesson3"
  And I press "Create New Lesson"
  Then I should be on the FSD-Training-Site home page
  And I should see "Lesson3"


Scenario: delete a lesson
  When I am on the edit page for "Lesson1"
  And I follow "delete"
  Then I should be on the FSD-Training-Site home page
  And I should not see "Lesson1"
