class Vote < ApplicationRecord
  #acts_as_token_authenticatable
  belongs_to :user
  belongs_to :solution

end
