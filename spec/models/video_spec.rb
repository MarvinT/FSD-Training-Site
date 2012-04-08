require 'spec_helper'

describe Video do

  describe 'Checking for valid videos' do
    it 'should return true if the url is valid' do
      testUrl = '<iframe width="420" height="315" src="http://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>'
      Video.isValidUrl?(testUrl).should be(true)
    end

    it 'should reject invalid urls' do
      badUrl = '<iframe width="420" height="315" src="http://www.blutube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>'
      Video.isValidUrl?(badUrl).should be(false)
    end
  end

  describe 'Extracting embedable url' do
    it 'should extract the main part of the url from the extra formatting' do
      embed_url = 'http://www.youtube.com/embed/dQw4w9WgXcQ'
      full_url = '<iframe width="420" height="315" src="http://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>'
      Video.embedableUrl(full_url).should == embed_url
    end
  end
end
