# Add a declarative step here for populating the DB with movies.

Given /the following lessons exist/ do |lessons_table|
  lessons_table.hashes.each do |lesson|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Lesson.create!(lesson)
  end
 
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  page.body.should =~ /#{e1}.*#{e2}/m
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.gsub(',',' ').split.each { |rating|
  if uncheck == "un"
    When %Q{I uncheck "ratings[#{rating}]"}
  else
    When %Q{I check "ratings[#{rating}]"}
  end
  }  
end

Then /I should see all of the lessons/ do
  page.should have_css("table#lessons tr", :count=> Lesson.find(:all).length + 1)
end
