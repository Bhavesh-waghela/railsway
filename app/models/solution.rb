class Solution < ApplicationRecord
    has_many :votes
  
  def as_json(options = {})
       {
          id: self.id,
          question: self.question,
          total_votes: self.votes.count,
          created_at: self.created_at
        }
  end
end
