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


end
