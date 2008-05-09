# == Schema Information
# Schema version: 20080507182740
#
# Table name: posts
#
#  id           :integer(11)     not null, primary key
#  permalink    :string(255)     
#  title        :string(255)     
#  excerpt      :text            
#  body         :text            
#  state        :integer(11)     
#  published_at :datetime        
#  user_id      :integer(11)     
#  created_at   :datetime        
#  updated_at   :datetime        
#

class Post < Entry
end
