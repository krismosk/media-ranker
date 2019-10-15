class Work < ApplicationRecord
  has_many :votes
  validates :category, :creator, :publication_year, :description, presence: true
  validates :title, presence: true, uniqueness: true

  # pre-votes implementation
  def self.select_spotlight
    spotlight_work = Work.all.sample
    return spotlight_work
  end


end
