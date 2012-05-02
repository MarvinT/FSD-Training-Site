Feature: Include a Twitter Feed on the Home Page

	As an admin
	So that volunteers can see our tweets
	I want to have our Twitter feed on our home page

Background: lessons in database

 Given the following lessons exist:
 
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |

Scenario: should see the twitter feed on home page 
  Given I am on the FSD-Training-Site home page
  Then I should see the Twitter feed

Scenario: should not see the twitter feed on home page 
  Given I am on the detail page for "Lesson1"
  Then I should not see the Twitter feed