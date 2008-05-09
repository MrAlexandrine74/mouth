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
