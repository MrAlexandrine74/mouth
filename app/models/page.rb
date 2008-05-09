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

class Page < Entry
end
