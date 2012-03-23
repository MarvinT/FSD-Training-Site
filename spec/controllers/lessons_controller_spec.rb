require 'spec_helper'

describe LessonController do
  describe 'add video to a lesson' do
    before :each do
      @Lesson1 = new Lesson
      @Lesson2 = new Lesson
      @testUrl = "http://www.youtube.com/watch?v=dQw4w9WgXcQ&ob=av2n"
    end

    it 'should add videos with valid urls' do
      Video.stub(:isValidUrl?).and_return(true)
      post :addVideo, {:lesson_id => @Lesson1.id, :video_url => testUrl}
      @Lesson1.components.empty?.should be(false)
      #should replace with better test once we know how the controller method works
    end

    it 'should not add videos with invalid urls' do
      Video.stub(:isValidUrl?).and_return(false)
      @Lesson2.addVideo(@testUrl)
      @Lesson2.components.empty?.should be(true)
    end

    it 'should show the Edit Lesson view' do
      response.should render_template('edit_lesson')
    end

  end
end
