require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(user_name: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:problem) { Problem.create(user: user, title: "This is a problem", description: "Description of the problem") }
  let(:solution) { Solution.create( user: user, problem: problem, description: "Description of the solution") }
  let(:lost_item) { LostItem.create( user: user, name: "Item you've lost", description: "description of item if necessary") }
  let(:location) { Location.create( user: user, lost_item: lost_item, name: "Name of where it may be found", description: "description of location")}

  let(:comment) { Comment.create(user: user, commented_on: problem, content: "I hate it when this happens!")}
  let(:comment1) { Comment.create(user: user, commented_on: solution, content: "This is how I usually fix this")}
  let(:comment2) { Comment.create(user: user, commented_on: lost_item, content: "Ugh, I lose this all the time!")}
  let(:comment3) { Comment.create(user: user, commented_on: location, content: "Always the last place you'd think to look!")}
  let(:comment4) { Comment.create(user: user, commented_on: comment, content: "Me too.")}
  let(:invalid) { Comment.create(user: user, commented_on: problem, content: "Invalid comment")}

  it "is invalid when no user is assigned" do 
    invalid.user = nil
    expect(invalid.valid?).to be false
  end

  it "is invalid when no post is assigned" do 
    invalid.commented_on = nil
    expect(invalid.valid?).to be false
  end

  it "is invalid with no content" do 
    invalid.content = nil
    expect(invalid.valid?).to be false
  end

  it "is valid when attributed to a user and post, and has content" do
    comment = Comment.create(user: user, commented_on: problem, content: "what an interesting problem!")
    expect(comment.valid?).to be true
  end

  it 'validates content' do 
    invalid.content = nil
    invalid.valid?
    expect(invalid.errors[:content].size).to eq(1)
  end
end