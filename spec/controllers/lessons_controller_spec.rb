require 'spec_helper'

describe LessonsController do
 
  describe 'show test' do
    it 'show the correct id page' do
      fake_lesson = mock('Lesson', :id => '1')
      Lesson.should_receive(:find).with('1').
        and_return(fake_lesson)
      post :show, {:id => '1'}
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
    describe 'after valid creation' do
      before :each do
        post :create, {:lesson => @fake_lesson}    
      end
 
      it 'should appear the created the lesson in home page' do
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
  end   
  
end