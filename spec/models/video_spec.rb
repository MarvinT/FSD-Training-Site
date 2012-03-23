require 'spec_helper'

describe Video do
  describe 'saving a video' do
=begin
    before :each do
      @testVideo = Video.create!
    end
=end
    it 'should check if the url is valid' do
      testUrl = "http://www.youtube.com/watch?v=dQw4w9WgXcQ&ob=av2n"
      Video.isValidUrl?(testUrl).should be(true)
    end

    it 'should reject invalid urls' do
      badUrl = "http://www.youtube.com/watch?v=KaqC5FnvAEc"
      Video.isValidUrl?(badUrl).should be(false)
    end
  end
end
