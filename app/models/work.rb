class Work < ApplicationRecord
  has_many :votes
  validates :category, :creator, :publication_year, :description, presence: true
  validates :title, presence: true, uniqueness: true

  # pre-votes implementation
  def self.select_spotlight
    # works.max_by
    # works.vount.count
    works = Work.all
    spotlight_work = works.max_by { |work| work.votes.length }

    return spotlight_work
  end

  # pre-votes implementation
  # TO-DO: add logic to deal with no records returned
  def self.select_top_ten(category)
    result = Work.where(category: category)
    # if result = []
    # return result
    # else
    # works.sort_by do |work|
    #  -work.votes.count
    # end

    # use .take(10) to pick the top 10
    if result.empty?
      return nil
    end
    
    # if there is less than 10 records in result, display all
    if result.length < 10
      return result
    end 

    # if there's more than 10 records in result
    # find the excess and remove those records from result
    if result.length > 10
      excess_works = result.length - 10
      new_result = result.drop(excess_works)
      return new_result
    end
  end


end
