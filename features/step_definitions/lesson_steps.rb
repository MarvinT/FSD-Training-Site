Then /^I should see the Facebook feed$/ do
  page.find('div.fb-like-box')['data-href'].should == 'http://www.facebook.com/Foundation.for.Sustainable.Development'
end

Then /^I should see the Twitter feed$/ do
  page.find('div#right_sidebar').find('script')[:src].should == 'http://widgets.twimg.com/j/2/widget.js'
  page.find('div#right_sidebar').find('script', {:text => 'infoFSD'})
end

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

Given /the following videos exist/ do |videos_table|
  videos_table.hashes.each do |video|
    Video.create!(video)
  end
end

Given /the following documents exist/ do |documents_table|
  documents_table.hashes.each do |document|
    Document.create!(document)
  end
end

Given /the following prezis exist in "(.*)"/ do |lesson, prezis_table|
  l = Lesson.find_by_title("#{lesson}")
  prezis_table.hashes.each do |prezis|
    p = Prezi.create!(prezis)
    l.prezis << p
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that lesson to the database here.
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

Then /^I should see "(.*)" in this order:$/ do |component, table|
  pattern = table.raw.flatten.collect(&Regexp.method(:quote)).join('.*?')
  pattern = Regexp.compile(pattern, Regexp::MULTILINE)
  page.find_by_id("#{component}").text.should =~ pattern
end

When /^I drag the first "(.*)" down one$/ do |component|

  page.execute_script %Q{
    $('#{component} tr:first').simulateDragSortable({move: 1});
  }
  # pending "need to simulate jquery drag event"
end



