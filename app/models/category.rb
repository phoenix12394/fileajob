class Category < ActiveRecord::Base
  has_many :microposts, :dependent => :destroy
  attr_accessible :name, :category_id, :user_id
  validates :name, :presence => true, :length => {:maximum => 50}

end
