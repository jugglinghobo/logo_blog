class Post < ActiveRecord::Base
  attr_accessible :header, :content, :user_id
  
  belongs_to :user
  has_many :responses

end
