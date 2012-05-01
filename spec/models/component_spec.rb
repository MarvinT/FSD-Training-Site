require 'spec_helper'
require 'rubygems'


describe Component do
  describe 'component reordering' do
    it 'should set position as 1 if there are no videos' do
      fake_video = mock('Video', :url=>'fakeurl')
      Video.should_receive(:all).and_return([])
      fake_video.should_receive(:class).and_return(Video)
      fake_video.should_receive(:position).and_return(nil)
      fake_video.should_receive(:position=).with(1)
      Video.next_position(fake_video)
    end

    it 'should set position as 1 if there are no prezis' do
      fake_prezi = mock('Prezi', :url=>'fakeurl')
      Prezi.should_receive(:all).and_return([])
      fake_prezi.should_receive(:class).and_return(Prezi)
      fake_prezi.should_receive(:position).and_return(nil)
      fake_prezi.should_receive(:position=).with(1)
      Prezi.next_position(fake_prezi)
    end

    it 'should set position as 1 if there are no documents' do
      fake_document = mock('Document', :url=>'fakeurl')
      Document.should_receive(:all).and_return([])
      fake_document.should_receive(:class).and_return(Document)
      fake_document.should_receive(:position).and_return(nil)
      fake_document.should_receive(:position=).with(1)
      Document.next_position(fake_document)
    end


    it 'should set position as the next open position for videos' do
      fake_video1 = mock('Video', :url=>'fakeurl', :position=>nil)
      fake_video2 = mock('Video', :url=>'fakeurl', :position=>2)
      Video.should_receive(:all).and_return([fake_video1, fake_video2])
      Video.stub(:order).with(:position).and_return([fake_video1, fake_video2])
      fake_video1.should_receive(:class).and_return(Video)
      fake_video1.should_receive(:position=).with(3)
      Video.next_position(fake_video1)
    end

    it 'should set position as the next open position for prezis' do
      fake_prezi1 = mock('Prezi', :url=>'fakeurl', :position=>nil)
      fake_prezi2 = mock('Prezi', :url=>'fakeurl', :position=>2)
      Prezi.should_receive(:all).and_return([fake_prezi1, fake_prezi2])
      Prezi.stub(:order).with(:position).and_return([fake_prezi1, fake_prezi2])
      fake_prezi1.should_receive(:class).and_return(Prezi)
      fake_prezi1.should_receive(:position=).with(3)
      Prezi.next_position(fake_prezi1)
    end

    it 'should set position as the next open position for documents' do
      fake_document1 = mock('Document', :url=>'fakeurl', :position=>nil)
      fake_document2 = mock('Document', :url=>'fakeurl', :position=>2)
      Document.should_receive(:all).and_return([fake_document1, fake_document2])
      Document.stub(:order).with(:position).and_return([fake_document1, fake_document2])
      fake_document1.should_receive(:class).and_return(Document)
      fake_document1.should_receive(:position=).with(3)
      Document.next_position(fake_document1)
    end

  end

end
