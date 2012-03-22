
Feature: Upload Videos

	As an admin
	So that I can share videos with volunteers
	I want to be able to upload videos to a specific lesson

Background: lessons in database

  Given the following lessons exist:
  | title      | release_date |
  | Lesson1    |   2012-01-15 |
  | Lesson2    |   2012-02-15 |
  	
Scenario: upload video to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I enter the url for "Video1"
  And  I press "submit"
  Then I should see "Video1 successfully uploaded"
