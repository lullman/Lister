class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists

  has_and_belongs_to_many :collaborations, class_name: "List", join_table: "collaborators"

  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends,         -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend
  has_many :received_friends,       -> { where(friendships: { accepted: true }) }, through: :received_friendships, source: :user
  has_many :pending_friends,        -> { where(friendships: { accepted: false }) }, through: :friendships, source: :friend
  has_many :requested_friendships,  -> { where(friendships: { accepted: false }) }, through: :received_friendships, source: :user

  # validates :username, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  
  def friends
    active_friends | received_friends
  end

  def pending
    pending_friends | requested_friendships
  end
end
