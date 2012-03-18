Feature: Upload Documents

	As an admin
	So that I can share documents with volunteers
	I want to be able to upload documents to a specific lesson

Background: lessons in database

  Given the following lessons exist:
  Lesson1
  Lesson2

Scenario: upload document to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I enter the url for "Document1"
  And  I press "submit"
  Then I should see "Document1 successfully uploaded"