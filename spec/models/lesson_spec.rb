require 'spec_helper'

describe Lesson do
 describe 'check title' do
   it 'should return title of the lesson' do
     fake_lesson = mock('Lesson1', :id => '1')
     Lesson.stub(:find).with("1").
       and_return(fake_lesson)
     fake_lesson.should_receive(:title).
       and_return('Lesson1')
     Lesson.title("1")
   end
 end

  describe 'lesson reordering' do
    it 'should set next position as 0 if there are no lessons' do
      Lesson.stub(:all).and_return([])
      Lesson.next_position().should == 0
    end

    it 'should return the next open position' do
      fake_lesson1 = mock('Lesson1', :title=>'fake1', :id =>1, :position => 1)
      fake_lesson2 = mock('Lesson2', :title=>'fake2', :id =>2, :position => 2)
      Lesson.stub(:order).with(:position).and_return([fake_lesson1, fake_lesson2])
      Lesson.stub(:all).and_return([fake_lesson1, fake_lesson2])
      Lesson.next_position().should == 3
    end

  end
end
