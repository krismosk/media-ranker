class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work, dependent: :destroy
  validates :user, :work, :date, presence: true
end
