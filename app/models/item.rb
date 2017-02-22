class Item < ActiveRecord::Base

  belongs_to :list
  has_many :votes

  scope :without_votes, -> { includes(:votes).where(:votes => { :id => nil }) }
  scope :with_positive_votes, -> { joins(:votes).having('SUM(vote_value) > 0').group('items.id') }

  def voted?(user_id)
    self.votes.where(user_id: user_id).sum(:vote_value)
  end

  def vote_total
    self.votes.count == 0 ? nil : self.votes.sum(:vote_value)
  end

end