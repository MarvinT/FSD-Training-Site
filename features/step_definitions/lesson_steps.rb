

Given /^I enter the url for "([^"]*)"$/ do |url|
  pending # express the regexp above with the code you wish you had

end
# 
# Given /^I am logged in$/ do
  # Given %{I am on the login page}
   # fills_in("Email", :with => "marvin")
   # fills_in("Passwd", :with => "marvin2012")
   # clicks_button("signIn")
# end

Given /^I try to login$/ do 
  begin
    fill_in("Email", :with => "marvin")
    fill_in("Passwd", :with => "marvin2012")
    click_link("signIn")
  rescue
  end
end

Given /^I am logged in$/ do
  controller.session[:admin_user] = true
end

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

And /I upload "(.*)" as my video$/ do |embed_code|

  fill_in("video_url", :with => embed_code)
end
