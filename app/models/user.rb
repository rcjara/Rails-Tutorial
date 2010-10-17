# == Schema Information # Schema version: 20101014020158
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  #this is a comment
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessor :password

  has_many :microposts

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,     :presence => true,
                       :length => { :maximum => 50 }
  validates :email,    :presence => true,
                       :format => { :with => email_regex },
                       :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :length => { :within => 6..40 },
                       :confirmation => true

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return nil unless user
    return nil unless user.has_password?(password)
    user
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end

  def has_password?(password)
    encrypt(password) == encrypted_password
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
  
end
