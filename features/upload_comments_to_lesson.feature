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
  And I fill in "comment_title" with "Comment1"
  And I fill in "comment_body" with "Comment1 body"
  And I fill in "comment_editor" with "User1"
  And I press "Submit Comment"
  Then I am on the detail page for "Lesson1"
  And I should see "Comment1"

Scenario: try to Submit Comment comments without including a comment title
  Given I am on the detail page for "Lesson1"
  And I fill in "comment_body" with "Comment1 body"
  And I press "Submit Comment"
  Then I should see "You must enter a title for comment"

Scenario: edit a existing comment
  Given I am on the detail page for "Lesson1"
  And  I fill in "comment_title" with "Comment1"
  And  I fill in "comment_body" with "Comment1 body"
  And  I fill in "comment_editor" with "User1"
  And  I press "Submit Comment"
  And  I am on the detail page for "Lesson1"
  And  I follow "edit/delete this comment"
  And  I am on the comment edit page for "Comment1"
  And  I fill in "comment_body" with "Comment1 body changed"
  And  I press "Save Changes"
  Then I am on the detail page for "Lesson1"
  And I should see "Comment1 body changed"

@javascript
Scenario: delete a existing comment
  Given I am on the detail page for "Lesson1"
  And  I fill in "comment_title" with "Comment1"
  And  I fill in "comment_body" with "Comment1 body"
  And  I fill in "comment_editor" with "User1"
  And  I press "Submit Comment"
  And  I am on the detail page for "Lesson1"
  And  I follow "edit/delete this comment"
  And  I am on the comment edit page for "Comment1"
  And I follow "Delete Comment"
  And I press "OK" on the pop up
  Then I should be on the detail page for "Lesson1"
  And I should see "Comment 'Comment1' deleted."
  And I should not see "Comment1 body"


