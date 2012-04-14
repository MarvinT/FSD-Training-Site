@comments
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
  And  I fill in "Com_title" with "Comment1"
  And  I fill in "Com_body" with "Comment1 body"
  And  I fill in "Com_editor" with "User1"
  And  I press "upload"
  Then I am on the detail page for "Lesson1"
  And I should see "Comment1"

Scenario: try to upload comments without including a comment title
  Given I am on the detail page for "Lesson1"
  And  I fill in "Com_body" with "Comment1 body"
  And I press "upload"
  Then I should see "Please enter a valid comment"
 
Scenario: edit a existing comment
  Given I am on the detail page for "Lesson1"
  And  I fill in "Com_title" with "Comment1"
  And  I fill in "Com_body" with "Comment1 body"
  And  I fill in "Com_editor" with "User1"
  And  I press "upload"
  And  I am on the detail page for "Lesson1"
  And  I follow "Edit_1"
  And  I am on the comment edit page for "Comment1"
  And  I fill "Com_body_1" with "Comment1 body changed"
  And  I press "submit"
  Then I am on the detail page for "Lesson1"
  And I should see "Comment1 body changed"
  
@javascript
Scenario: delete a existing comment
  Given I am on the detail page for "Lesson1"
  And  I fill in "Com_title" with "Comment1"
  And  I fill in "Com_body" with "Comment1 body"
  And  I fill in "Com_editor" with "User1"
  And  I press "upload"
  And  I am on the detail page for "Lesson1"
  And  I follow "Edit_1"
  And  I am on the comment edit page for "Comment1"
  And I follow "Delete Video"
  And I press "OK" on the pop up
  Then I should be on the detail page for "Lesson1"
  And I should see "You have deleted a comment for this lesson."
  And I should not see "Comment1"


