Feature: Reordering Videos

   As an admin
   So that I can change the order of videos online
   I want to be able to modify the ordering of videos

Background: lessons in database
  Given the following lessons exist: 

  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  |Lesson3          |the third lesson  |

  Given the following videos exist in "Lesson1":
  |title  |url                        |
  |vid1   |http://youtu.be/Q_h4IoPJXZw|
  |vid2   |http://youtu.be/Q_h4IoPJXZw|

@javascript
Scenario: Reordering should be saved

  Given I am on the FSD-Training-Site home page
  And I follow "Lesson1"
  And I follow "Reorder Videos"
  Then I should see "videos" in this order:
  	| vid1	|
  	| vid2	|
  
  When I drag the first "video" of "Lesson1" down one
  When I reload the FSD-Training-Site home page
  And I follow "Lesson1"
  And I follow "Reorder Videos"
  Then I should see "videos" in this order:
	| vid2	|
	| vid1	|



