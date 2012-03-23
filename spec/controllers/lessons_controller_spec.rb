require 'spec_helper'

describe LessonsController do

  describe 'show test' do
    it 'show the correct id page' do
      fake_lesson = mock('Lesson', :id => '1')
      Lesson.should_receive(:find).with('1').
        and_return(fake_lesson)
      get :show, {:id => '1'}
      response.should render_template('lessons/show')
      assigns(:lesson).should == fake_lesson
    end
  end

  describe 'index test' do
    it 'show the index page' do
      Lesson.should_receive(:all)
      post :index
      response.should render_template('index')
    end
  end

  describe 'create, edit, update, destroy test' do
    before :each do
      @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson', 'release_date' => '25-Nov-2011'}
      @fake_result = mock('Lesson', :id => '1', :title => 'lesson1', :description => 'sample lesson', :release_date => '25-Nov-2011')
    end
    it 'should create the lesson page' do
      Lesson.should_receive(:create!).with(@fake_lesson).
        and_return(@fake_result)
      post :create, {:lesson => @fake_lesson}
    end
    
    it 'should appear the created the lesson in home page' do
      post :create, {:lesson => @fake_lesson}
      response.should redirect_to('/lessons')
    end

    it 'should go to the edit page of the lesson' do
      Lesson.should_receive(:find).with('1').
        and_return(@fake_result)
      post :edit, {:id => '1'}
      response.should render_template('edit')
    end

    it 'should update the lesson page' do
      Lesson.stub(:find).
        and_return(@fake_result)
      @fake_result.should_receive(:update_attributes!).with(@fake_lesson)
      post :update, {:id => '1', :lesson => @fake_lesson}
      response.should redirect_to(lesson_path(@fake_result))
    end

    it 'should destroy the lesson page' do
      Lesson.stub(:find).
        and_return(@fake_result)
      @fake_result.should_receive(:destroy)
      post :destroy, {:id => '1'}
      response.should redirect_to('/lessons')
    end
  end

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

