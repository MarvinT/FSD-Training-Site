Feature: Viewing Lessons
	
	As a volunteer
	So that I can go through components of a lesson online
	I want to be able to view embedded documents, prezis and videos

Background: lessons in database

  Given the following lessons exist:

  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  	
Scenario: should see the lesson on home page 
  Given I am on the FSD-Training-Site home page
  Then I should see "Lesson1"

Scenario: I try to view an invalid lesson
  Given I am on the detail page for lesson number "5000"
  Then I should be on the FSD-Training-Site home page
  And I should see "Lesson not found."
