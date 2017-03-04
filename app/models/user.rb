class User < ActiveRecord::Base

  include BCrypt

  has_many :lists

  has_and_belongs_to_many :collaborations, class_name: "List", join_table: "collaborators"

  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends,         -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend
  has_many :received_friends,       -> { where(friendships: { accepted: true }) }, through: :received_friendships, source: :user
  has_many :pending_friends,        -> { where(friendships: { accepted: false }) }, through: :friendships, source: :friend
  has_many :requested_friendships,  -> { where(friendships: { accepted: false }) }, through: :received_friendships, source: :user
  
  def friends
    active_friends | received_friends
  end

  def pending
    pending_friends | requested_friendships
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end