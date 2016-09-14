class Solution < ApplicationRecord
    has_many :votes
    acts_as_taggable
    paginates_per 1
    extend FriendlyId
    friendly_id :question
    
  def as_json(options = {})
     {
        id: self.id,
        question: self.question,
        total_votes: self.votes.count,
        created_at: self.created_at
      }
  end

   def self.sort_by_votes
    sorted_votes = Solution.all.sort_by { |solution| solution.votes.count }
    sorted_votes.reverse
  end
end
