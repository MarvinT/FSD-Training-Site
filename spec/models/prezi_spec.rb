require 'spec_helper'

describe Prezi do

  describe 'Checking for valid prezi' do
    it 'should return true if the prezi url is a valid one' do
      testUrl = "http://prezi.com/h43habmufp73/uploadpreztester/"
      Prezi.isValidUrl?(testUrl).should == true
    end

    it 'should reject invalid urls' do
      badUrl = "http://prozi.com/h43habmufpt3/"
      Prezi.isValidUrl?(badUrl).should == false
    end
  end

  describe 'extracting the embeddable url' do
    it 'should extract the prezi id' do
      embeddable_url = '7sbj0ysnngal'
      given_url = 'http://prezi.com/7sbj0ysnngal/uploadpreztest2/'
      Prezi.embeddableUrl(given_url).should == embeddable_url
    end
  end

  

end
