Feature: Upload Documents

	As an admin
	So that I can share documents with volunteers
	I want to be able to upload documents to a specific lesson

Background: lessons in database

  Given the following lessons exist:
  
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |

Scenario: upload document to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I enter the url for "Document1"
  And  I press "submit"
  Then I should see "Document1 successfully uploaded"

Scenario: upload an invalid document url to an existing lesson
  Given I am on the detail page for "Lesson1"
  And I fill in "content" with "http://www.gobbeldygook.gov"
  And I press "submit"
  Then I should see "Failure: invalid url. Please try again"