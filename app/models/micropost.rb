class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :location_id, :title, :category_id, :compensation
  belongs_to :user
  belongs_to :location
  belongs_to :category
  
  default_scope :order => 'microposts.created_at DESC'

  validates :content, :presence => true, :length => {:maximum => 140}
 # validates :user_id, :presence => true
 # validates :location_id, :presence => true
  

end
