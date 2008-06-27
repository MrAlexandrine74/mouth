# == Schema Information
# Schema version: 20080626021705
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
  
  validates_length_of     :name, :within => 1..128
  validates_uniqueness_of :name
  
  # Set a preference and return its value
  def self.set(name, value)
    pref = self.find_or_initialize_by_name(name)
    pref.value = value
    pref.save!
    pref.value
  end
  
  # Get a preference and return its value column
  def self.get(name, reload=false)
    global_name = name.to_s.underscore.downcase # FIXME: this isn't working
    eval ("
    @#{global_name} #{"||" unless reload}= Preference.find(:first, :conditions => { :name => name })
    @#{global_name}.value unless @#{global_name}.nil?
    ")
  end
end
