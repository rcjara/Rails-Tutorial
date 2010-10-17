# == Schema Information
# Schema version: 20101014020158
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
  has_many :microposts

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length => {:maximum => 50}
  validates :email, :presence => true,
                    :format => {:with => email_regex },
                    :uniqueness => {:case_sensitive => false}

  def formatted_email
    "#{@name} <#{@email}>"
  end
  
end
