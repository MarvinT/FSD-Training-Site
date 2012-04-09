require 'spec_helper'

describe Lesson do
 describe 'check title' do
   it 'should return title of the movie' do
     fake_lesson = mock('Lesson1', :id => '1')
     Lesson.stub(:find).with("1").
       and_return(fake_lesson)
     fake_lesson.should_receive(:title).
       and_return('Lesson1')
     Lesson.title("1")
   end
 end
end
