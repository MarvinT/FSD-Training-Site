require 'spec_helper'

describe Lesson do

  describe 'retrieving videos from a lesson' do
    before :each do
      @lesson1 = Lesson.create(:title => 'First test', :description => 'testing')
      @lesson2 = Lesson.create(:title => 'Second test')
      @v1 = Video.create(:url => 'youtube.com/1')
      @v2 = Video.create(:url => 'youtube.com/2')
      @v3 = Video.create(:url => 'youtube.com/3')
      @v4 = Video.create(:url => 'youtube.com/4')
      @lesson1.components << @v1
      @lesson1.components << @v2
      @lesson2.components << @v3
      @lesson2.components << @v4
      @lesson1vids = @lesson1.videos
      @lesson2vids = @lesson2.videos
    end

    it 'should return videos that were added to the lesson' do
      @lesson1vids.should include @v1
      @lesson1vids.should include @v2
      @lesson2vids.should include @v3
      @lesson2vids.should include @v4
    end

    it 'should not return videos from another lesson' do
      @lesson1vids.should_not include @v3
      @lesson1vids.should_not include @v4
      @lesson2vids.should_not include @v1
      @lesson2vids.should_not include @v2
    end
  end

end
