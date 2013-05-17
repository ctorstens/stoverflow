class Question < ActiveRecord::Base
  attr_accessible :title, :content

  has_many :votes, :as => :votable
  has_many :answers
  belongs_to :user

  validates :title, :content, :presence => true
  

  def vote_score
    self.votes.map{|vote| vote.value }.inject(0) {|sum,v| sum + v}
  end
end
