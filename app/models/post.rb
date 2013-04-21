class Post < ActiveRecord::Base
  attr_accessible :content, :user_id
  
  belongs_to :user

  def responses
    ["a", "b", "c"]
  end


end
