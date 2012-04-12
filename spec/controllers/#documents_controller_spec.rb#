# -*- coding: utf-8 -*-
require 'spec_helper'

describe DocumentsController do
  before :each do
    @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson', :id => '1'}
    @fake_doc = mock('Document', :id => '1', "url" => "a_valid_url")
    controller.stub(:admin?).and_return(true)
  end


  describe 'the create method' do

    it 'should send back a redirect to the lesson page on successful creation' do
      Document.should_receive(:isValidUrl?).with('a_valid_url').and_return(true)
      Document.should_receive(:new).with('url'=> 'a_valid_url').
        and_return(@fake_doc)
      Document.should_receive(:embedableUrl).with('a_valid_url').and_return('a_valid_url')
      @fake_doc.should_receive(:save).and_return(true)
      Lesson.should_receive(:find).with('1').
          and_return(@fake_lesson)
      @fake_lesson.should_receive(:documents).and_return([])
      post :create, {:lesson_id => 1, :documents => {:url => 'a_valid_url'}}

      response.should redirect_to('/lessons/1')
    end

    it 'should redirect to the document upload page with a valid documentl submission' do
       Document.should_receive(:isValidUrl?).with('not_a_url').and_return(false)

      post :create, {:lesson_id => 1, :document => {:url => 'not_a_url'}}

      response.should redirect_to('/lessons/1/documents/new')

    end
  end

  describe 'destroying documents’' do
    it 'should destroy a document when the controller method is called' do
      Document.stub(:find).
        and_return(@fake_doc)

      Lesson.stub(:find).and_return(@fake_lesson)
      @fake_doc.should_receive(:destroy)
      post :destroy, {:id => '1', :lesson_id => '1'}
      response.should redirect_to('/lessons/1?description=sample+lesson&title=lesson1')



    end
  end
 end
