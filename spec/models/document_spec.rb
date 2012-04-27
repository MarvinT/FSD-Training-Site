# -*- coding: utf-8 -*-
require 'spec_helper'

describe Document do

  describe 'Checking for valid document’' do
    it 'should return true if the document url is valid' do
      testUrl = "https://docs.google.com/document/pub?id=1Kh7QOtwI7ZtKadWWAumRPU1-HDbHARgCRJIkg5QeUMw"

      Document.isValidUrl?(testUrl).should == true
    end

    it 'should reject invalid urls' do
      badUrl = "https://docs.google.com/file/0B-WZbzkEKZrlMzg2NmFmMDctMmY2Mi00ZWY2LWIwNTQtNWUyYzBiNWEzM2Yx/edit"
#pdfs not embeddable as google docs
      Document.isValidUrl?(badUrl).should == false
    end
  end

  describe 'extracting the embeddable url' do
    it 'should add on an embedded parameter' do
      embedable_url = 'https://docs.google.com/document/pub?id=test&amp;embedded=true'
      given_url = 'https://docs.google.com/document/pub?id=test'
      Document.embedableUrl(given_url).should == embedable_url
    end
  end

  describe 'document reordering' do
    it 'should set next position as 1 if there are no Documents' do
      pending "need next_position method"
      Document.stub(:all).and_return([])
      Document.next_position().should == 1
    end

    it 'should return the next open position' do
      pending "need next_position method"
      fake_doc1 = mock('doc1', :title=>'fake1', :id =>1, :position => 1)
      fake_doc2 = mock('doc2', :title=>'fake2', :id =>2, :position => 2)
      Document.stub(:order).with(:position).and_return([fake_doc1, fake_doc2])
      Document.stub(:all).and_return([fake_doc1, fake_doc2])
      Document.next_position().should == 3
    end

  end

end

