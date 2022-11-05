require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(user_name: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:problem) { Problem.create(user: user, title: "This is a problem", description: "Description of the problem") }
  let(:solution) { Solution.create( user: user, problem: problem, description: "Description of the solution") }
  let(:lost_item) { LostItem.create( user: user, name: "Item you've lost", description: "description of item if necessary") }
  let(:location) { Location.create( user: user, lost_item: lost_item, name: "Name of where it may be found", description: "description of location")}
  let(:comment) { Comment.create( user: user, commented_on: problem, content: "bla bla bla")}

  let(:like) { Like.create(user: user, liked: problem, category: "like") }
  let(:like1) { Like.create(user: user, liked: solution, category: "love") }
  let(:like2) { Like.create(user: user, liked: lost_item, category: "laugh") }
  let(:like3) { Like.create(user: user, liked: location, category: "angry") }
  let(:like4) { Like.create(user: user, liked: comment, category: "like") }
  let(:invalid) { Like.create(user: user, liked: problem, category: "like") }

  it "is invalid when no user is assigned" do 
    invalid.user = nil
    expect(invalid.valid?).to be false
  end

  it "is invalid when no post is assigned" do 
    invalid.liked = nil
    expect(invalid.valid?).to be false
  end

  it "is invalid with no category" do 
    invalid.category = nil
    expect(invalid.valid?).to be false
  end

  it "is valid when attributed to a user and post/comment, and has category" do
    expect(like.valid?).to be true
  end

  it "works for all types of content" do
    expect(like.valid?).to be true
    expect(like1.valid?).to be true
    expect(like2.valid?).to be true
    expect(like3.valid?).to be true
    expect(like4.valid?).to be true
  end
end