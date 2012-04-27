Feature: Reordering Prezis

   As an admin
   So that I can change the order of prezis online
   I want to be able to modify the ordering of prezis

Background: lessons in database
  Given the following lessons exist: 

  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  |Lesson3          |the third lesson  |

  Given the following prezis exist in "Lesson1":
  |url                                                        |
  |http://prezi.com/2ge5bhookyep/welcome-to-fsd-international/|
  |http://prezi.com/c2ycdr4b3bsw/abcd-ii-b/                   |

@javascript
Scenario: I can drag and drop prezis to reorder
  Given I am on the FSD-Training-Site home page
  And I follow "Lesson1"
  Then I should see "prezis" in this order:
  	| 2ge5bhookyep |
  	| c2ycdr4b3bsw |
  
  When I drag the first "prezi" down one
  Then I should see "prezis" in this order:
	| c2ycdr4b3bsw	|
	| 2ge5bhookyep	|
  	
  	
@javascript
Scenario: Reordering should be saved

  Given I am on the FSD-Training-Site home page
  And I follow "Lesson1"
  Then I should see "prezis" in this order:
  	| 2ge5bhookyep	|
  	| c2ycdr4b3bsw	|
  
  When I drag the first "prezi" down one
  When I reload the FSD-Training-Site home page
  Then I should see "prezis" in this order:
	| c2ycdr4b3bsw	|
	| 2ge5bhookyep	|



