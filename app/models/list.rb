class List < ActiveRecord::Base

  belongs_to :user
  has_many :items

  has_and_belongs_to_many :collaborators, class_name: "User", join_table: "collaborators"

end