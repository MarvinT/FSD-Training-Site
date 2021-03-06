Feature: Reordering Lessons
	
	As an admin
	So that I can change the order of lessons online
	I want to be able to modify the ordering of lessons

Background: lessons in database

  Given the following lessons exist:

  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  |Lesson3          |the third lesson  |
  	
@javascript
Scenario: Reordering should be saved
  Given I am on the FSD-Training-Site home page
  Then I should see "lessons" in this order:
  	| Lesson1	|
  	| Lesson2	|
  	| Lesson3	|
  When I drag the first lesson down one
  When I reload the FSD-Training-Site home page
  Then I should see "lessons" in this order:
  	| Lesson2	|
  	| Lesson1	|
  	| Lesson3	|

