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
      @new_work.creator = nil 
      
      expect(@new_work.valid?).must_equal false
      expect(@new_work.errors.messages).must_include :creator
      expect(@new_work.errors.messages[:creator]).must_equal ["can't be blank"]
    end

    it "must have a publication year" do
      @new_work.publication_year = nil 
      
      expect(@new_work.valid?).must_equal false
      expect(@new_work.errors.messages).must_include :publication_year
      expect(@new_work.errors.messages[:publication_year]).must_equal ["can't be blank"]
    end 

    it "must have a description" do
      @new_work.description = nil 
      
      expect(@new_work.valid?).must_equal false
      expect(@new_work.errors.messages).must_include :description
      expect(@new_work.errors.messages[:description]).must_equal ["can't be blank"]
    end
  end

  describe "custom methods" do
    describe "#select_spotlight" do
      it "returns a randomly selected media" do
        spotlight_media = Work.select_spotlight
      
        expect(spotlight_media).must_be_instance_of Work
      end
    end

    describe "#select_top_ten" do
      it "returns nil if no works of that category" do
        result = Work.select_top_ten(:song)
        expect(result).must_be_nil
      end

      it "returns the entire list of works if less than 10 of that type" do
        result = Work.select_top_ten(:movie)
        expect(result.length).must_equal 3
      end 

      it "returns only 10 works if there is more than 10 works of that type" do
        result = Work.select_top_ten(:book)
        expect(result.length).must_equal 10
      end 


    end
  end

  # TO-DO: FILL IN FOR WAVE 2
  describe "relationships" do
    it "can have many votes" do
      # fill in for wave 2
    end 
  end 

end
