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

end

