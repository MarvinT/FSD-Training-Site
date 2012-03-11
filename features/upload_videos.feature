Feature: Upload Videos

	As an admin
	So that I can share videos with volunteers
	I want to be able to upload videos to a specific lesson

  	
Scenario: upload video to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I fill in "upload_video" with "upload_video_path"
  And  I press "submit"
  Then I should see "upload_video_path"
