

Given /^I enter the url for "([^"]*)"$/ do |url|
  pending # express the regexp above with the code you wish you had

end


# Add a declarative step here for populating the DB with movies.

Given /the following lessons exist/ do |lessons_table|
  lessons_table.hashes.each do |lesson|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Lesson.create!(lesson)
  end

end

Then /I should see all of the lessons/ do
  page.should have_css("table#lessons tr", :count=> Lesson.find(:all).length + 1)
end

And /I press "OK" on the pop up/ do
  page.driver.browser.switch_to.alert.accept


end

And /I press "Cancel" on the pop up/ do
  page.driver.browser.switch_to.alert.dismiss

end
