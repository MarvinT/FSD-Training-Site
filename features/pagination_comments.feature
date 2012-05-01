Feature: Paginate Comments

	As a user
	So that I can load pages quickly and read comments in an orderly fashion
	I would like to have comments paginated

Background: lessons in database

  Given the following lessons exist:
  
  |title            |description       |
  |Lesson1          |the first lesson  |
  |Lesson2          |the second lesson |
  
  And the following comments exist:
  |title            |editor            |body             |lesson_id        |
  |Comment1         |user1             |comment1 body    |1                |
  |Comment2         |user2             |comment2 body    |1                |
  |Comment3         |user3             |comment3 body    |1                |
  |Comment4         |user4             |comment4 body    |1                |
  |Comment5         |user5             |comment5 body    |1                |
  |Comment6         |user6             |comment6 body    |1                |
  |Comment7         |user7             |comment7 body    |1                |
  |Comment8         |user8             |comment8 body    |1                |
  |Comment9         |user9             |comment9 body    |1                |
  |Comment10        |user10            |comment10 body   |1                |
  |Comment11        |user11            |comment11 body   |1                |
  |Comment12        |user12            |comment12 body   |1                |
  |Comment13        |user13            |comment13 body   |1                |
  |Comment14        |user14            |comment14 body   |1                |
  |Comment15        |user15            |comment15 body   |1                |
  |Comment16        |user16            |comment16 body   |1                |
  |Comment17        |user17            |comment17 body   |1                |
  |Comment18        |user18            |comment18 body   |1                |
  |Comment19        |user19            |comment19 body   |1                |
    
@wip
Scenario: One page only shows 15 comments
  Given I am on the detail page for "Lesson1"
  Then I should not see "comment16 body"

@wip  
Scenario: Go to the second page
  Given I am on the detail page for "Lesson1"
  And I follow "Next Page"
  Then I should see "comment16 body"



