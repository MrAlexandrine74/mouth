# == Schema Information
# Schema version: 20080509164356
#
# Table name: preferences
#
#  id             :integer(11)     not null, primary key
#  preferrer_id   :integer(11)     not null
#  preferrer_type :string(128)     default(""), not null
#  preferred_id   :integer(11)     
#  preferred_type :string(255)     default(""), not null
#  name           :string(128)     default(""), not null
#  value          :text            
#

class Preference < ActiveRecord::Base
  
  belongs_to :preferrer, :polymorphic => true
  belongs_to :preferred, :polymorphic => true
  
  serialize :value
  validates_length_of     :name, :within => 1..128
  validates_uniqueness_of :name, :on => :create, :scope => [ :preferrer_id, :preferrer_type, 
                                                             :preferred_id, :preferred_type ]
                                                             
  def self.global_preference
    { :preferred_type => 'global', :preferrer_type => 'global', :preferred_id => 1, :preferrer_id => 1 }
  end
  
  def self.set(name, value)
    if pref = get(name)
      pref.update_attribute(:value, value)
    else
      pref = Preference.create( { :name => name, :value => value }.merge(global_preference) )
    end
    pref    
  end
  
  def self.get(name)
    Preference.find(:first, :conditions => { :name => name }.merge(self.global_preference))
  end
end
