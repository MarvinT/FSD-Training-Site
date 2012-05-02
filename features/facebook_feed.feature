Feature: Include a Facebook Feed on the Home Page

	As an admin
	So that volunteers can see our Facebook updates
	I want to have our Facebook feed on our home page

Background: lessons in database

 Given the following lessons exist:
 
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |

  	
Scenario: should see the facebook feed on home page 
  Given I am on the FSD-Training-Site home page
  Then I should see the Facebook feed

Scenario: should not see the facebook feed when not on home page
  Given I am on the detail page for "Lesson1"
  Then I should not see the Facebook feed