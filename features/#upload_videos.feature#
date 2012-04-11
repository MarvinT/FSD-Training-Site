
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
  And I follow "Upload Video"
  And  I upload "http://youtu.be/Q_h4IoPJXZw" as my video
  And  I press "Upload Video"
  Then I should be on the detail page for "Lesson1"

Scenario: upload an invalid video url to an existing lesson
  Given I am on the detail page for "Lesson1"
  And I follow "Upload Video"
  And I upload "http://www.gobbeldygook.gov" as my video
  And I press "Upload Video"
  Then I should see "Sorry, your URL was invalid. Please enter a valid URL."

@javascript
Scenario: delete a video from a lesson
  Given I am on the detail page for "Lesson1"
  And I follow "Upload Video"
  And I upload "http://youtu.be/Q_h4IoPJXZw" as my video
  And I press "Upload Video"
  Then I should be on the detail page for "Lesson1"
  And I follow "Delete Video"
  And I press "OK" on the pop up
  Then I should be on the detail page for "Lesson1"
  Then I should see "You have deleted a video for this lesson."
  
