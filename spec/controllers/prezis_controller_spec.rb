require 'spec_helper'

describe PrezisController do
  before :each do
    @fake_lesson = {'title' => 'lesson1', "description" => 'sample lesson', :id => '1'}
    @fake_prezi = mock('Prezi', :id => '1', "url" => "a_valid_url")
    controller.stub(:admin?).and_return(true)
  end

  describe 'the create method' do
    it 'should send back a redirect to the lesson page on sccessful creation' do
      Prezi.should_receive(:isValidUrl?).with('a_valid_url').and_return(true)
      Prezi.should_receive(:new).with('url'=> 'a_valid_url').
        and_return(@fake_prezi)
      Prezi.should_receive(:embeddableUrl).with('a_valid_url').and_return('a_valid_url')
      @fake_prezi.should_receive(:save).and_return(true)
      Lesson.should_receive(:find).with('1').
          and_return(@fake_lesson)
      @fake_lesson.should_receive(:prezis).and_return([])
      post :create, {:lesson_id => 1, :prezi => {:url => 'a_valid_url'}}

      response.should redirect_to('/lessons/1')
    end

    it 'should redirect to the document upload page if an invalid url was given' do
      Prezi.should_receive(:isValidUrl?).with('not_a_url').and_return(false)
      post :create, {:lesson_id => 1, :prezi => {:url => 'not_a_url'}}
      response.should redirect_to('/lessons/1/prezis/new')
    end
  end

  describe 'destroying prezis' do
    it 'should destroy a prezi when the controller method is called' do
      Prezi.stub(:find).
        and_return(@fake_prezi)
      Lesson.stub(:find).and_return(@fake_lesson)
      @fake_prezi.should_receive(:destroy)
      post :destroy, {:id => '1', :lesson_id => '1'}
      response.should redirect_to('/lessons/1?description=sample+lesson&title=lesson1')
    end
  end
end
