class Work < ApplicationRecord
  has_many :votes
  validates :category, :creator, :publication_year, :description, presence: true
  validates :title, presence: true, uniqueness: true

  # pre-votes implementation
  def self.select_spotlight
    spotlight_work = Work.all.sample
    return spotlight_work
  end

  def self.select_top_ten(category)
    # passing in a category symbol
    # take that category and run a query to return
    # 10 works of that cateogory in an array
    result = Work.where(category: category)
    return result




    # top_ten_works = []
    # selected_work = nil
    # 10.times do 
    #   selected_work = Work.where(category: category)
    #   # top_ten_works << selected_work
    # end
    # return selected_work
    
    
    # top_ten_works = []
    # 10.times do 
    #   s
    # end 

    # return top_ten_works
  end


end
