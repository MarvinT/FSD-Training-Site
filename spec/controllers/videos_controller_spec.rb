require 'spec_helper'

describe VideosController do
  before :each do
    @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson', :id => '1'}
    @fake_video = mock('Video', :id => '1', "url" => "a_valid_url")
    controller.stub(:admin?).and_return(true)
  end


  describe 'the create method' do


    it 'should send back a redirect to the lesson page on successful creation' do
      Video.should_receive(:isValidUrl?).with('a_valid_url').and_return(true)
      Video.should_receive(:new).with('url'=> 'a_valid_url').
        and_return(@fake_video)
      Video.should_receive(:embedableUrl).with('a_valid_url').and_return('a_valid_url')
      @fake_video.should_receive(:save).and_return(true)
      Lesson.should_receive(:find).with('1').
          and_return(@fake_lesson)
      @fake_lesson.should_receive(:videos).and_return([])
      post :create, {:lesson_id => 1, :video => {:url => 'a_valid_url'}}

      response.should redirect_to('/lessons/1')
    end

    it 'should redirect to the video upload page with a valid video url submission' do
       Video.should_receive(:isValidUrl?).with('not_a_url').and_return(false)

      post :create, {:lesson_id => 1, :video => {:url => 'not_a_url'}}

      response.should redirect_to('/lessons/1/videos/new')


    end
  end
 end
