Feature: Upload Documents

	As an admin
	So that I can share documents with volunteers
	I want to be able to upload documents to a specific lesson

  	
Scenario: upload document to existing a lesson
  Given I am on the detail page for "Lesson1"
  And  I fill in "upload_document" with "upload_document_path"
  And  I press "submit"
  Then I should see "upload_document_path"