

Given /^I enter the url for "([^"]*)"$/ do |url|
  pending # express the regexp above with the code you wish you had

end

Given /^I try to login$/ do
  fill_in("Email", :with => "marvin")
  fill_in("Passwd", :with => "marvin2012")
  click_link("signIn")
end


Given /the following lessons exist/ do |lessons_table|
  lessons_table.hashes.each do |lesson|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that lesson to the database here.
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

And /I upload "(.*)" as my document$/ do |doc_url|
  fill_in("document_url", :with => doc_url)
end

And /I upload "(.*)" as my prezi$/ do |prez_url|
  fill_in("prezi_url", :with => prez_url)
end

Then /^I should see lessons in this order:$/ do |table|
  pattern = table.raw.flatten.collect(&Regexp.method(:quote)).join('.*?')
  pattern = Regexp.compile(pattern, Regexp::MULTILINE)
  page.find_by_id("lessons").text.should =~ pattern
end

When /^I drag "([^"]*)" down one$/ do |lesson|
  drop_place = page.all(:css, "table tr").select { |e| e.text.include?('Lesson3') }[0]
  target = page.all(:css, "table tr").select { |e| e.text.include?(lesson) }[0]
  pending "need to simulate jquery drag event"
end

