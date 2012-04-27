Feature: Reordering Documents

   As an admin
   So that I can change the order of documents online
   I want to be able to modify the ordering of documents

Background: lessons in database
  Given the following lessons exist: 

  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  |Lesson3          |the third lesson  |

  Given the following documents exist:
  |title  |url                                                                                 |
  |doc1   |https://docs.google.com/document/pub?id=1Kh7QOtwI7ZtKadWWAumRPU1-HDbHARgCRJIkg5QeUMw|
  |doc2   |https://docs.google.com/document/pub?id=1Kh7QOtwI7ZtKadWWAumRPU1-HDbHARgCRJIkg5QeUMw|


@javascript
Scenario: I can drag and drop documents to reorder
  Given I am on the FSD-Training-Site home page
  Then I should see "documents" in this order:
  	| doc1	|
  	| doc2	|
  
  When I drag the first "document" down one
  Then I should see "documents" in this order:
	| doc2	|
	| doc1	|
  	
  	
@javascript
Scenario: Reordering should be saved

  Given I am on the FSD-Training-Site home page
  Then I should see "documents" in this order:
  	| doc1	|
  	| doc2	|
  
  When I drag the first "document" down one
  When I reload the FSD-Training-Site home page
  Then I should see "documents" in this order:
	| doc2	|
	| doc1	|



