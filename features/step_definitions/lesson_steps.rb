Given /the following lessons exist/ do |lessons_table|

  lessons_table.hashes.each do |lesson|


    @lesson = Lesson.create!(lesson)

  end
end

Given /^I enter the url for "([^"]*)"$/ do |url|
  pending # express the regexp above with the code you wish you had

end




