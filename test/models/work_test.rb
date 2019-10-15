require "test_helper"

describe Work do
  it "can be instantiated" do
    new_work = Work.create(
      category: "movie",
      title: "Little Ladies",
      creator: "Benedict Sadat",
      publication_year: 1994,
      description: "Persistent even-keeled toolset",
      )
    expect(new_work.valid?).must_equal true
  end

  it "will have the required fields" do
    new_work = Work.create(
      category: "movie",
      title: "Little Ladies",
      creator: "Benedict Sadat",
      publication_year: 1994,
      description: "Persistent even-keeled toolset",      
    )
    
    work = Work.first
    [:category, :title, :creator, :publication_year, :description].each do |field|
      expect(work).must_respond_to field
    end
  end

  # TO-DO: FILL IN FOR WAVE 2
  describe "relationships" do
    it "can have many votes" do
    end 
  end 

  describe "validations" do
    it "must have a category" do
    end 
    
    it "must have a title" do
    end 

    it "must have a unique title" do
    end

    it "must have a creator" do
    end

    it "must have a publication year" do
    end 

    it "must have a description" do
    end
  end

  describe "custom methods" do
    describe "#select_spotlight" do
      it "return a randomly selected media" do
      end
    end

    describe "#select_top_ten" do
      # add it blocks for nominal and edge cases
    end
  end



end
