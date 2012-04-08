require 'spec_helper'

describe VideosController do
  before :each do
    @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson', :id => '1'}
    @fake_video = mock('Video', :id => '1', "url" => "a_valid_url")
  end


  describe 'the create method' do


    it 'should send back a redirect to the lesson page on successful creation' do
      Video.should_receive(:new).with('url'=> @fake_video[:url]).
        and_return(@fake_video)
      Video.should_receive(:embedableUrl).with('url' => @fake_video[:url]).and_return('')

      Lesson.should_receive(:find).with('1').
          and_return(@fake_result)
      post :create, {:lesson => @fake_lesson, :video => {:url => 'a_valid_url'}}

      response.should redirect_to('/lesson/1')
    end

    it 'should redirect to the video upload page with a valid video url submission' do


      Video.should_receive(:new).with('url'=> @fake_video[:url]).
        and_return(@fake_video)
      Lesson.should_receive(:find).with('1').
        and_return(@fake_result)
      post :create, {:lesson => @fake_lesson, :video => {:url => 'not_a_url'}}

      response.should redirect_to('/lesson/1')


    end
  end
 end
