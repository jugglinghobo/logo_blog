class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  has_many :posts, :dependent => :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates_presence_of :name, :password, :password_confirmation
  validates_confirmation_of :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true, :format => { :with => VALID_EMAIL_REGEX }


  def to_s
    name
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
