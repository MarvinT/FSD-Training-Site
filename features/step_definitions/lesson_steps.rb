Then /^I should see the Facebook feed$/ do
  page.find('div.fb-like-box')['data-href'].should == 'http://www.facebook.com/Foundation.for.Sustainable.Development'
end

Then /^I should not see the Facebook feed$/ do
  page.should_not have_css('div.fb-like-box')
end

Then /^I should see the Twitter feed$/ do
  page.find('div#left_sidebar').find('script')[:src].should == 'http://widgets.twimg.com/j/2/widget.js'
  page.find('div#left_sidebar').find('script', {:text => 'infoFSD'})
end

Then /^I should not see the Twitter feed$/ do
  page.find('div#left_sidebar').should_not have_css('script', :src => 'http://widgets.twimg.com/j/2/widget.js')
end

Given /^I enter the url for "([^"]*)"$/ do |url|
  pending # express the regexp above with the code you wish you had

end




Given /the following lessons exist/ do |lessons_table|
  lessons_table.hashes.each do |lesson|
    Lesson.create!(lesson)
  end
end

Given /the following videos exist in "(.*)"/ do |lesson, videos_table|
  l = Lesson.find_by_title(lesson)
  videos_table.hashes.each do |video|
    l.videos << Video.create!(video)
  end
end

Given /the following documents exist in "(.*)"/ do |lesson, documents_table|
  l = Lesson.find_by_title(lesson)
  documents_table.hashes.each do |document|
    l.documents << Document.create!(document)
  end
end

Given /the following prezis exist in "(.*)"/ do |lesson, prezis_table|
  l = Lesson.find_by_title(lesson)
  prezis_table.hashes.each do |prezis|
    l.prezis << Prezi.create!(prezis)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
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

Then /^I should see "(.*)" in this order:$/ do |component_type, table|
  table_name = 'components'
  if component_type == 'lessons' then
    table_name = component_type
  end
  pattern = table.raw.flatten.collect(&Regexp.method(:quote)).join('.*?')
  pattern = Regexp.compile(pattern, Regexp::MULTILINE)
  page.find_by_id(table_name).text.should =~ pattern
end

When /^I drag the first lesson down one$/ do
  post '/lessons/sort', "lessons"=>["2", "1", "3"]
end

When /^I drag the first "([^"]*)" of "([^"]*)" down one$/ do |component_type, lesson|
  l = Lesson.find_by_title(lesson)
  url = '/lessons/' + l.id.to_s + '/' + component_type + 's/sort'
  post url, "components"=>["2", "1"]
end
