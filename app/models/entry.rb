# == Schema Information
# Schema version: 20080509164356
#
# Table name: entries
#
#  id           :integer(11)     not null, primary key
#  permalink    :string(255)     
#  title        :string(255)     
#  excerpt      :text            
#  body         :text            
#  state        :string(255)     default("draft")
#  published_at :datetime        
#  user_id      :integer(11)     
#  created_at   :datetime        
#  updated_at   :datetime        
#  type         :string(255)     
#

class Entry < ActiveRecord::Base
  belongs_to              :user
  
  validates_presence_of   :title, :body
  validates_presence_of   :permalink, :if => Proc.new { |entry| entry.should_permalink? }
  validates_uniqueness_of :permalink
  
  alias_attribute         :to_s,      :title
  alias_attribute         :to_param,  :permalink
  
  has_permalink           :title #, :if => Proc.new { |entry| entry.should_permalink? }
  
  named_scope :drafts,    :conditions => { :state => "draft" }
  named_scope :private,   :conditions => { :state => "private" }
  named_scope :published, :conditions => { :state => "published" }  
  named_scope :from_permalink, lambda { |permalink| { :conditions => ['permalink = ?', permalink] } }
  
  acts_as_state_machine   :initial => :draft
  state :draft
  state :private
  state :published, :enter => :do_publish
  
  event :publish do
    transitions :from => :draft,    :to => :published
    transitions :from => :private,  :to => :published
  end
  
  def should_permalink?
    self.published? && (self.permalink.nil? || self.permalink.blank?)
  end
  
  def do_publish
    self.published_at = Time.now
  end
  
end
