require "test_helper"

describe Vote do
  it "can be instantiated" do 
    user = User.create(
      username: "kmosk",
      joined_date: Time.now,
    )
    work = Work.create(
      category: "movie",
      title: "Little Ladies",
      creator: "Benedict Sadat",
      publication_year: 1994,
      description: "Persistent even-keeled toolset",
    )
    vote = Vote.create(
      date: Time.now,
      user_id: user.id,
      work_id: work.id, 
    )

    expect(vote.valid?).must_equal true
  end 

  it "will have the required fields" do
    user = User.create(
      username: "kmosk",
      joined_date: Time.now,
    )
    work = Work.create(
      category: "movie",
      title: "Little Ladies",
      creator: "Benedict Sadat",
      publication_year: 1994,
      description: "Persistent even-keeled toolset",
    )
    vote = Vote.create(
      date: Time.now,
      user_id: user.id,
      work_id: work.id, 
    )

    vote = Vote.first
    [:date, :user_id, :work_id].each do |field|
      expect(vote).must_respond_to field
    end
  end 

  describe "validations" do
    it "must have a date" do
    end

    it "must have a user" do
    end

    it "must have a work" do
    end
  end

  describe "relationships" do
    it "belongs to a user" do
    end

    it "belongs to a work" do
    end
  end

end
