Feature: Upload Comments on Individual Lesson Pages

	As a volunteer
	So that I can share my opinion about specific documents, prezis, and videos
	I want to be able to add comments to lessons

Background: lessons in database

 Given the following lessons exist:
 
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  	
Scenario: upload comments to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I fill in "comment" with "my comment"
  And  I press "submit"
  Then I should see "my comment"
