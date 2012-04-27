require 'spec_helper'

describe Prezi do

  describe 'Checking for valid prezi' do
    it 'should return true if the prezi url is a valid one' do
      testUrl = "http://prezi.com/h43habmufp73/uploadpreztester/"
      Prezi.isValidUrl?(testUrl).should == true
    end

    it 'should reject invalid urls' do
      badUrl = "http://prezi.com/h43habmufpt3/"
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

  describe 'prezi reordering' do
    it 'should set next position as 1 if there are no prezis' do
      pending "need next_position method"
      Prezi.stub(:all).and_return([])
      Prezi.next_position().should == 1
    end

    it 'should return the next open position' do
      pending "need next_position method"
      fake_prezi1 = mock('prezi1', :title=>'fake1', :id =>1, :position => 1)
      fake_prezi2 = mock('prezi2', :title=>'fake2', :id =>2, :position => 2)
      Prezi.stub(:order).with(:position).and_return([fake_prezi1, fake_prezi2])
      Prezi.stub(:all).and_return([fake_prezi1, fake_prezi2])
      Prezi.next_position().should == 3
    end

  end

end
