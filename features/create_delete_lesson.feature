Feature: Create or Delete a Lesson

	As an admin
	So that I can organize documetns, videos, and prezzies into lessons
	I want to be able to create or delete a lesson

Background: lessons in database

  Given the following lessons exist:
  Lesson1
  	
Scenario: delte a lesson
  When I go to the edit page for "Lesson1"
  And  I follow "delete"
  Then I should be on the FSD-Training-Site home page
  And I should not see "Lesson1"
