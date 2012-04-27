require 'spec_helper'

describe Video do

  describe 'Checking for valid videos' do
    it 'should return true if the url is valid' do
      testUrl = "http://youtu.be/dQw4w9WgXcQ"
      Video.isValidUrl?(testUrl).should be(true)
    end

    it 'should reject invalid urls' do
      badUrl = "http://www.youtu.be/dQw4w9WgXy"
      Video.isValidUrl?(badUrl).should be(false)
    end
  end

  describe 'Extracting embedable url' do
    it 'should extract the main part of the url from the extra formatting' do
      embed_url = 'http://www.youtube.com/embed/dQw4w9WgXcQ'
      full_url = "http://youtu.be/dQw4w9WgXcQ"
      Video.embedableUrl(full_url).should == embed_url
    end
  end

    describe 'video reordering' do
    it 'should set next position as 1 if there are no videos' do
      pending "need next_position method"
      Video.stub(:all).and_return([])
      Video.next_position().should == 1
    end

    it 'should return the next open position' do
      pending "need next_position method"
      fake_video1 = mock('Video1', :title=>'fake1', :id =>1, :position => 1)
      fake_video2 = mock('Video2', :title=>'fake2', :id =>2, :position => 2)
      Video.stub(:order).with(:position).and_return([fake_video1, fake_video2])
      Video.stub(:all).and_return([fake_video1, fake_video2])
      Video.next_position().should == 3
    end

  end

end
