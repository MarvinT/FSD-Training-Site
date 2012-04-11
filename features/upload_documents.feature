Feature: Upload Document

	As an admin
	So that I can share documents with volunteers
	I want to be able to upload documents to a specific lesson

Background: lessons in database

 Given the following lessons exist:

 |title            |description       |
 |Lesson1          |the first lesson  |
 |Lesson2          |the second lesson |
 	
Scenario: upload a valid document to existing a lesson
 Given I am on the detail page for "Lesson1"
 And I follow "Upload Document"
 And I upload "https://docs.google.com/document/pub?id=1Kh7QOtwI7ZtKadWWAumRPU1-HDbHARgCRJIkg5QeUMw" as my document
 And I press "Upload Document"
 Then I should be on the detail page for "Lesson1"
 And I should see "Document successfully uploaded."

Scenario: upload an invalid video url to an existing lesson
 Given I am on the detail page for "Lesson1"
 And I follow "Upload Document"
 And I upload "http://www.gobbeldygook.gov" as my document
 And I press "Upload Document"
 Then I should see "Sorry, your URL was invalid. Please enter a valid URL."

@javascript
Scenario: delete a document from a lesson
  Given I am on the detail page for "Lesson1"
  And I follow "Upload Document"
  And I upload "https://docs.google.com/document/pub?id=1Kh7QOtwI7ZtKadWWAumRPU1-HDbHARgCRJIkg5QeUMw/edit" 
  And I press "Upload Document"
  Then I should be on the detail page for "Lesson1"
  And I follow "Delete Document"
  And I press "OK" on the pop up
  Then I should be on the detail page for "Lesson1"
  Then I should see "You have deleted a document for this lesson."
