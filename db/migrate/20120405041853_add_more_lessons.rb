class AddMoreLessons < ActiveRecord::Migration
  MORE_LESSONS = [
    {:title => 'Lesson1', :description => 'lesson1 description'},
    {:title => 'Lesson2', :description => 'lesson2 description'},
    {:title => 'Lesson3', :description => 'lesson3 description'},
    {:title => 'Lesson4', :description => 'lesson4 description'},
    {:title => 'Lesson5', :description => 'lesson5 description'},
    {:title => 'Lesson6', :description => 'lesson6 description'},
    {:title => 'Lesson7', :description => 'lesson7 description'},
    {:title => 'Lesson8', :description => 'lesson7 description'},
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