class User < ApplicationRecord
  has_many :votes
  validates :name, :joined_date, presence: true
end
