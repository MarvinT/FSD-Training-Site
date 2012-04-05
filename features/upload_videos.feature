
Feature: Upload Videos

	As an admin
	So that I can share videos with volunteers
	I want to be able to upload videos to a specific lesson

Background: lessons in database

  Given the following lessons exist:

  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  	
Scenario: upload a valid video to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I fill in "content" with "http://www.youtube.com/watch?v=U6tV11acSRk"
  And  I press "submit"
  Then I should see "Video1 successfully uploaded"

Scenario: upload an invalid video url to an existing lesson
  Given I am on the detail page for "Lesson1"
  And I fill in "content" with "http://www.gobbeldygook.gov"
  And I press "submit"
  Then I should see "Failure: invalid url. Please try again"
