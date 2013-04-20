class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :posts

  validates_presence_of :email, :name
end
