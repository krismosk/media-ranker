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

  describe "validations" do
    before do
      @new_work = Work.create(
        category: "movie",
        title: "Little Ladies",
        creator: "Benedict Sadat",
        publication_year: 1994,
        description: "Persistent even-keeled toolset",
        )
    end
    
    it "must have a category" do
      @new_work.category = nil 

      expect(@new_work.valid?).must_equal false
      expect(@new_work.errors.messages).must_include :category
      expect(@new_work.errors.messages[:category]).must_equal ["can't be blank"]
    end 
    
    it "must have a title" do
      @new_work.title = nil 
      
      expect(@new_work.valid?).must_equal false
      expect(@new_work.errors.messages).must_include :title
      expect(@new_work.errors.messages[:title]).must_equal ["can't be blank"]
    end 

    it "must have a unique title" do
      work = Work.create(
        category: "movie",
        title: "Little Ladies",
        creator: "Benedict Cumberbatch",
        publication_year: 1994,
        description: "About short women",
        )

      expect(work.valid?).must_equal false
      expect(work.errors.messages).must_include :title
      expect(work.errors.messages[:title]).must_equal ["has already been taken"]
    end

    it "must have a creator" do
    end

    it "must have a publication year" do
    end 

    it "must have a description" do
    end
  end

  # TO-DO: FILL IN FOR WAVE 2
  describe "relationships" do
    it "can have many votes" do
      # fill in for wave 2
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
