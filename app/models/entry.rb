# == Schema Information
# Schema version: 20080508133737
#
# Table name: entries
#
#  id           :integer(11)     not null, primary key
#  permalink    :string(255)     
#  title        :string(255)     
#  excerpt      :text            
#  body         :text            
#  state        :string(255)     default("passive")
#  published_at :datetime        
#  user_id      :integer(11)     
#  created_at   :datetime        
#  updated_at   :datetime        
#  type         :string(255)     
#

class Entry < ActiveRecord::Base
  belongs_to              :user
  
  validates_presence_of   :title, :permalink
  validates_uniqueness_of :permalink
  
  alias_attribute         :slug, :permalink
  
  has_permalink           :title
  
  acts_as_state_machine   :initial => :draft  
  state :draft
  state :private
  state :published
  
  event :publish do
    transitions :from => :draft, :to => :published
    transitions :from => :private, :to => :published
  end
  
  named_scope :drafts,    :conditions => { :state => "draft" }
  named_scope :private,   :conditions => { :state => "private" }
  named_scope :published, :conditions => { :state => "published" }
end