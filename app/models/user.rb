class User < ApplicationRecord
  has_many :votes
  validates :username, :joined_date, presence: true
  
end
