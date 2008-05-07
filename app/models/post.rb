# == Schema Information
# Schema version: 20080505135911
#
# Table name: posts
#
#  id           :integer(11)     not null, primary key
#  permalink    :string(255)     
#  title        :string(255)     
#  excerpt      :text            
#  body         :text            
#  status       :integer(11)     
#  published_at :datetime        
#  user_id      :integer(11)     
#  created_at   :datetime        
#  updated_at   :datetime        
#

class Post < ActiveRecord::Base
  acts_as_state_machine :initial => :draft
  
  state :draft
  state :private
  state :published
  
  event :publish do
    transitions :from => :draft, :to => :published
    transitions :from => :private, :to => :published
  end
end
