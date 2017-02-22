class User < ActiveRecord::Base

  include BCrypt

  has_many :lists

  has_and_belongs_to_many :collaborations, class_name: "List", join_table: "collaborators"
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end