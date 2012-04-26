require 'spec_helper'

describe LessonsController do

  describe 'check setsize' do
    it 'should set the size of single lesson page' do 
      fake_lesson = mock('Lesson', :id => '1')
      Lesson.should_receive(:find).with('1').
        and_return(fake_lesson)
      post :setsize, {:id => '1', :pagesize => 20}
      response.should redirect_to(lesson_path(fake_lesson))
    end
  end


  describe 'show test' do
    it 'show the correct id page' do
      fake_lesson = mock('Lesson', :id => '1')
      fake_videos = [mock('Video', :id => '1'),mock('Video', :id => '2')]
      fake_documents = [mock('Document', :id => '1'),mock('Document', :id => '2')]
      fake_prezis = [mock('Prezi', :id => '1'),mock('Prezi', :id => '2')]
      fake_comments = [mock('Comment', :id => '1'),mock('Comment', :id => '2')]
      Lesson.should_receive(:find).with('1').
        and_return(fake_lesson)
      fake_lesson.should_receive(:videos).
        and_return(fake_videos)
      fake_lesson.should_receive(:documents).
        and_return(fake_documents)
      fake_lesson.should_receive(:prezis).
        and_return(fake_prezis)
      fake_lesson.should_receive(:totalpage).
        and_return('1')
      fake_lesson.should_receive(:subcomments).with('1').
        and_return(fake_comments)
      post :show, {:id => '1',:page => '1'}
      response.should render_template('show')
      assigns(:lesson).should == fake_lesson
      assigns(:videos).should == fake_videos
      assigns(:documents).should == fake_documents
      assigns(:prezis).should == fake_prezis
      assigns(:totalpage).should == '1'
      assigns(:comments).should == fake_comments
    end

    it 'show Lesson not found.' do
      Lesson.should_receive(:find).with('10').
        should raise_error
      post :show, {:id => '10'}
      response.should redirect_to('/lessons')
    end

  end

  describe 'index test' do
    it 'show the index page' do
      Lesson.should_receive(:order).with(:position)
      post :index
      response.should render_template('index')
    end
  end

  describe 'create, edit, update, destroy test' do
    before :each do
      @invalid_fake_lesson = {'title' => '', "description" => 'sample lesson'}
      @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson'}
      @fake_result = mock('Lesson', :id => '1', :title => 'lesson1', :description => 'sample lesson')
      controller.stub(:admin?).and_return(true)
      @fake_result.stub(:position=)
    end
    it 'should create the lesson page' do
      Lesson.should_receive(:new).with(@fake_lesson).
        and_return(@fake_result)
      @fake_result.should_receive(:save).and_return(true)
      post :create, {:lesson => @fake_lesson}
    end

    it 'should appear the created the lesson in home page' do
      Lesson.stub(:new).with(@fake_lesson).
        and_return(@fake_result)
      @fake_result.should_receive(:save).and_return(true)
      post :create, {:lesson => @fake_lesson}
      response.should redirect_to('/lessons')
    end

    it 'show You must enter a title for lesson.' do
      Lesson.should_receive(:new).with(@invalid_fake_lesson).and_return(@fake_result)
      @fake_result.should_receive(:save).and_return(false)
      post :create, {:lesson => @invalid_fake_lesson}
      response.should redirect_to('/lessons/new')
    end

    it 'should go to the edit page of the lesson' do
      Lesson.should_receive(:find).with('1').
        and_return(@fake_result)
      post :edit, {:id => '1'}
      response.should render_template('edit')
    end

    # it 'show Lesson not found.' do
      # Lesson.should_receive(:find).with('10').
        # should raise_error
      # post :edit, {:id => '10'}
      # response.should redirect_to('/lessons')
    # end

    it 'show Lesson not found.' do
      Lesson.stub(:find).with('10').
        and_raise(ActiveRecord::RecordNotFound)
      post :edit, {:id => '10'}
      response.should redirect_to('/lessons')
    end

    it 'should update the lesson page' do
      Lesson.stub(:find).
        and_return(@fake_result)
      @fake_result.should_receive(:update_attributes!).with(@fake_lesson)
      post :update, {:id => '1', :lesson => @fake_lesson}
      response.should redirect_to(lesson_path(@fake_result))
    end

    it 'show You must enter a title for lesson.' do
      Lesson.stub(:find).
        and_return(@fake_result)
      @fake_result.stub(:update_attributes!).with(@invalid_fake_lesson).
        and_raise(ActiveRecord::RecordInvalid)
      post :update, {:id => '1', :lesson => @invalid_fake_lesson}
      response.should redirect_to(edit_lesson_path(@fake_result))
    end

    it 'should destroy the lesson page' do
      Lesson.stub(:find).
        and_return(@fake_result)
      @fake_result.should_receive(:destroy)
      post :destroy, {:id => '1'}
      response.should redirect_to('/lessons')
    end
  end

  describe 'lesson sorting' do
    before :each do
      @fake_lesson1 = mock('Lesson', :id => '1', :title => 'lesson1', :description => 'sample lesson 1')
      @fake_lesson2 = mock('Lesson', :id => '2', :title => 'lesson2', :description => 'sample lesson 2')
      @fake_lesson3 = mock('Lesson', :id => '3', :title => 'lesson3', :description => 'sample lesson 3')
    end

    it 'should set the position' do
      Lesson.should_receive(:find).with(1).and_return(@fake_lesson1)
      @fake_lesson1.should_receive(:position=).with(0)
      @fake_lesson1.should_receive(:save).and_return(true)
      Lesson.should_receive(:find).with(2).and_return(@fake_lesson2)
      @fake_lesson2.should_receive(:save).and_return(true)
      @fake_lesson2.should_receive(:position=).with(2)
      Lesson.should_receive(:find).with(3).and_return(@fake_lesson3)
      @fake_lesson3.should_receive(:position=).with(1)
      @fake_lesson3.should_receive(:save).and_return(true)
      post :sort, {"lessons"=>["1", "3", "2"]}
    end
  end

end


