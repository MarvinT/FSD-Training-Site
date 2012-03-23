Feature: Viewing Lessons
	
	As a volunteer
	So that I can go through components of a lesson online
	I want to be able to view embedded documents, prezis and videos

Background: lessons in database

  Given the following lessons exist:
  | title      | release_date |
  | Lesson1    |   2012-01-15 |
  | Lesson2    |   2012-02-15 |
  	
Scenario: should see the lesson on home page 
  Given I am on the FSD-Training_Site home page
  Then I should see "Lesson1"
