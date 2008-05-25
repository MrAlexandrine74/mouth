require File.dirname(__FILE__) + '/../spec_helper'

describe Entry do
  describe 'as draft' do
    before(:each) do
      @entry = create_draft_entry
    end
    
    it 'is in default draft state' do
      @entry.state.should eql('draft')
    end
    
    it 'requires title' do
      lambda do
        broken_entry = create_draft_entry(:title => nil)
        broken_entry.errors.on(:title).should_not be_nil
      end.should_not change(Entry, :count)
    end
  
    it 'requires body' do
      lambda do
        broken_entry = create_draft_entry(:body => nil)
        broken_entry.errors.on(:body).should_not be_nil
      end.should_not change(Entry, :count)
    end
    
    it "does not create a permalink" #do
    #   entry = create_draft_entry
    #   entry.permalink.should be_nil
    # end
  end
  
  # describe 'as private post'
  
  describe 'as published' do
      before(:each) do
        @entry = create_published_entry        
      end
  
    it 'creates permalink if does not exist' do
      entry = create_published_entry(:title => 'foo')
      entry.permalink.should == 'foo'
    end
    
    it 'creates a permalink if blank on save' do
      @entry.update_attribute('permalink', '')
      @entry.permalink.should_not be_nil
    end
    
    it 'dasherizes permalink on a title with no spaces' do
      @entry.permalink.should == 'secret-world-domination-plans'      
    end
    
    it 'should ignore special characters in permalinks' do
      entry = create_published_entry(:title => "Foo!Bar")
      entry.permalink.should == "foo-bar"
    end
    
    it 'should have a unique permalink' do
      second_entry = create_published_entry(@entry.attributes)
      second_entry.permalink.should_not eql(@entry.attributes)
    end    
    
    it 'should not update permalink if title is changed' do
      lambda {
        @entry.update_attribute('title', 'Nothing to see here')      
      }.should_not change { @entry.permalink }
    end
    
    it 'should update published at when changed from draft to published'
    
    it 'should update published at if exists when changed status from draft to published'
    it 'should not update published at if exists on save'    
  end
  
end

def create_draft_entry(options = {})
  Entry.create({  :title => "Secret World Domination Plans", 
                  :body => "My secret domination plans are to randomly poison sausages.", 
                  :user => User.find(:first) }.merge(options))
end

def create_published_entry(options = {})
  entry = create_draft_entry(options)  
  entry.publish!
  entry
end