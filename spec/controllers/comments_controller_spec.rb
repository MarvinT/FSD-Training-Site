require 'spec_helper'

describe CommentsController do
  describe 'create comment' do
    before :each do
      @fake_lesson_result = mock('Lesson', :id => '1', :title => 'lesson1', :description => 'sample lesson')
      Lesson.stub(:find).with('1').
        and_return(@fake_lesson_result)
    end

    it 'should successfully add comment to lesson' do
      fake_comment = {'title' => 'comment1', 'editor' => 'user1', "body" => 'comment1', "lesson_id" => '1'}
      fake_comment_result = mock('Comment', :id => '1', :title => 'comment1', :editor => 'user1', :body => 'comment1', :lesson_id => '1')
      Comment.should_receive(:create!).with(fake_comment).
        and_return(fake_comment_result)
      post :create, {:lesson_id => '1', :comment => fake_comment}
      response.should redirect_to(lesson_path(Lesson.find('1')))
    end

    it 'should show wrong comment information' do
      invalid_fake_comment = {'editor' => 'user1', "body" => 'comment1', "lesson_id" => '1'}
      Comment.should_receive(:create!).with(invalid_fake_comment).
        should raise_error
      post :create, {:lesson_id => '1', :comment => invalid_fake_comment}
      response.should redirect_to(lesson_path(@fake_lesson_result))
    end
  end

  describe 'comment edit, update, destroy test' do
    before :each do
      @invalid_fake_lesson = {'title' => '', "description" => 'sample lesson'}
      @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson'}
      @fake_lesson_result = mock('Lesson', :id => '1', :title => 'lesson1', :description => 'sample lesson')
      @fake_comment_result = mock('Comment', :id => '1', :title => 'comment1', :editor => 'user1', :body => 'comment1', :lesson_id => '1')
      controller.stub(:admin?).and_return(true)
      Lesson.stub(:find).with('1').
          and_return(@fake_lesson_result)
    end

    it 'should go to the edit page of the comment' do
      Comment.should_receive(:find).with('1').
        and_return(@fake_comment_result)
      post :edit, {:lesson_id => '1', :id => '1'}
      response.should render_template('edit')
    end     

    it 'show Comment not found.' do
      Comment.stub(:find).with('10').
        and_raise(ActiveRecord::RecordNotFound)
      post :edit, {:lesson_id => '1', :id => '10'}
      response.should redirect_to(lesson_path(@fake_lesson_result))
    end

    describe 'should find the comment' do
      before :each do
        @invalid_fake_comment = {'editor' => 'user1', "body" => 'comment1', "lesson_id" => '1'}
        @fake_comment = {'title' => 'comment1', 'editor' => 'user1', "body" => 'comment1', "lesson_id" => '1'}
        Comment.stub(:find).
          and_return(@fake_comment_result)
      end

      it 'should update the comment page' do
        @fake_comment_result.should_receive(:update_attributes!).with(@fake_comment)
        post :update, {:lesson_id => '1', :id => '1', :comment => @fake_comment}
        response.should redirect_to(lesson_path(@fake_lesson_result))
      end

      it 'show You must enter a title for comment.' do
        @fake_comment_result.stub(:update_attributes!).
          and_raise(ActiveRecord::RecordInvalid)
        post :update, {:lesson_id => '1', :id => '1', :comment => @invalid_fake_comment}
        response.should redirect_to(edit_lesson_comment_path(@fake_comment_result))
      end

      it 'should destroy the lesson page' do
        @fake_comment_result.should_receive(:destroy)
        post :destroy, {:lesson_id => '1', :id => '1'}
        response.should redirect_to(lesson_path(@fake_lesson_result))
      end
    end
  end
end
