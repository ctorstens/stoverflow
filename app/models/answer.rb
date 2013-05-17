class Answer < ActiveRecord::Base
  attr_accessible :content

  has_many :votes, :as => :votable
  belongs_to :user
  belongs_to :question

  validates :content, :presence => true

  def vote_score
    self.votes.map{|vote| vote.value }.inject(0) {|sum,v| sum + v}
  end

end
