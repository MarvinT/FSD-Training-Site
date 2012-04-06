class AddMoreLessons < ActiveRecord::Migration
  MORE_LESSONS = [
    {:title => 'Lesson 1: Sample Title', :description => 'This is a sample description for Lesson 1'},
    {:title => 'Lesson 2: Sample Title', :description => 'This is a sample description for Lesson 2'},
    {:title => 'Lesson 3: Sample Title', :description => 'This is a sample description for Lesson 3'},
    {:title => 'Lesson 4: Sample Title', :description => 'This is a sample description for Lesson 4'},
    {:title => 'Lesson 5: Sample Title', :description => 'This is a sample description for Lesson 5'},
    {:title => 'Lesson 6: Sample Title', :description => 'This is a sample description for Lesson 6'},
    {:title => 'Lesson 7: Sample Title', :description => 'This is a sample description for Lesson 7'},
    {:title => 'Lesson 8: Sample Title', :description => 'This is a sample description for Lesson 8'},
  ]
  def up
    MORE_LESSONS.each do |lesson|
      Lesson.create!(lesson)
    end
  end

  def down
    MORE_LESSONS.each do |lesson|
      Lesson.find_by_title(lesson[:title]).destroy
    end
  end
end