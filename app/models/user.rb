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
  attr_accessor :name, :email

  def formatted_email
    "#{@name} <#{@email}>"
  end
  
end
