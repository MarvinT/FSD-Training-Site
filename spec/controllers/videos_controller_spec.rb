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
      Video.should_receive(:new).with('url'=> 'a_valid_url', 'title' => nil).
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

  describe 'destroying videos' do
    it 'should destroy a lesson when the controller method is called' do
      Video.stub(:find).
        and_return(@fake_video)

      Lesson.stub(:find).and_return(@fake_lesson)
      @fake_video.should_receive(:destroy)
      post :destroy, {:id => '1', :lesson_id => '1'}
      response.should redirect_to('/lessons/1?description=sample+lesson&title=lesson1')
    end
  end

  describe 'video sorting' do
    before :each do
      @fake_video1 = mock('Video', :id => '1', :title => 'video1', :description => 'sample video 1')
      @fake_video2 = mock('Video', :id => '2', :title => 'video2', :description => 'sample video 2')
      @fake_video3 = mock('Video', :id => '3', :title => 'video3', :description => 'sample video 3')
    end

    it 'should set the position' do
      pending "need sort method"
      Video.should_receive(:find).with(1).and_return(@fake_video1)
      @fake_video1.should_receive(:position=).with(0)
      @fake_video1.should_receive(:save).and_return(true)
      Video.should_receive(:find).with(2).and_return(@fake_video2)
      @fake_video2.should_receive(:save).and_return(true)
      @fake_video2.should_receive(:position=).with(2)
      Video.should_receive(:find).with(3).and_return(@fake_video3)
      @fake_video3.should_receive(:position=).with(1)
      @fake_video3.should_receive(:save).and_return(true)
      post :sort, {"videos"=>["1", "3", "2"]}
    end
  end

 end
