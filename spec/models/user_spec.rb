require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  let(:user) { User.create(user_name: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }

  it "is invalid without a user name" do
    user.user_name = nil
    expect(user.valid?).to be false
  end

  it "is invalid without a name" do
    user.display_name = nil
    expect(user.valid?).to be false
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user.valid?).to be false
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user.valid?).to be false
  end

  it "is valid with all attributes and no 'has_many' attributions" do
    expect(user.valid?).to be true
  end

  # -----------------------------------------------
  describe 'validations:' do 
    let(:invalid) { User.new }

    it 'validates username' do
      expect(invalid).to have(1).error_on(:user_name)
    end

    it 'validates display name' do
      expect(invalid).to have(1).error_on(:display_name)
    end

    it 'validates email' do
      expect(invalid).to have(1).error_on(:email)
    end

    it 'validates password' do
      expect(invalid).to have(1).error_on(:password)
    end
  end

  # -----------------------------------------------
  describe 'has_many:' do
    let(:problem) { Problem.create(user: user, title: "This is a problem", description: "Description of the problem") }
    let(:solution) { Solution.create( user: user, problem: problem, description: "Description of the solution") }
    let(:lost_item) { LostItem.create( user: user, name: "Item you've lost", description: "description of item if necessary") }
    let(:location) { Location.create( user: user, lost_item: lost_item, name: "Name of where it may be found", description: "description of location")}

    it "user is still valid with 'has_many' attributions" do
      expect(user.valid?).to be true
    end

    let(:user2) { User.create(user_name: "Second User", display_name: "Test Man", email: "second@test.com", password: "pass")}
    let(:problem2) { Problem.create(user: user2, title: "This is another problem", description: "Description of the other problem") }
    let(:lost_item2) { LostItem.create( user: user2, name: "Item someone else lost", description: "description of other item if necessary") }
    let(:solution2) { Solution.create( user: user, problem: problem2, description: "Description of the solution to another problem") }
    let(:location2) { Location.create( user: user, lost_item: lost_item2, name: "Name of wherethe other item may be found", description: "description of location of other item")}
    
    it "user can create solutions to other user's problems" do
      expect(user.valid?).to be true
    end

    # -----------------------------------------------
    describe 'comments:' do
      let(:comment) { Comment.create(user: user, commented_on: problem, content: "I hate it when this happens!")}
      let(:comment1) { Comment.create(user: user, commented_on: solution, content: "This is how I usually fix this")}
      let(:comment2) { Comment.create(user: user, commented_on: lost_item, content: "Ugh, I lose this all the time!")}
      let(:comment3) { Comment.create(user: user, commented_on: location, content: "Always the last place you'd think to look!")}

      it "user can create comments on their own content" do 
        expect(user.comments.count).to eq(4)
        expect(user.valid?).to be true
      end

      it "can respond to a comment" do
        response = Comment.create(user: user, commented_on: comment, content: "I forgot to add something...")
        expect(user.comments.count).to eq(5)
        expect(user.valid?).to be true
      end

      let(:comment6) { Comment.create(user: user2, commented_on: problem, content: "Hahaha, so glad that's never happened to me!") }
      it "can comment on other user's content" do
        comment5 = Comment.create(user: user, commented_on: problem2, content: "This happens to me too!")
        comment7 = Comment.create(user: user, commented_on: comment6, content: "You should be, it was NOT fun...")
        expect(user.comments.count).to eq(6)
        expect(user.valid?).to be true
      end

      # ----------------------------------------------
      describe 'likes:' do
        let(:like) { Like.create(user: user, liked: problem, category: "like") }
        let(:like1) { Like.create(user: user, liked: comment, category: "like") }

        it "user can't like their own content" do
          expect(like.valid?).to be false
          expect(like1.valid?).to be false
          expect(problem.likes.count).to eq(0)
        end

        let(:like2) { Like.create(user: user, liked: problem2, category: "love") }
        let(:like3) { Like.create(user: user, liked: comment6, category: "laugh") }

        it "user can like other users' content" do
          expect(like2.valid?).to be true
          expect(like3.valid?).to be true
          expect(problem2.likes.count).to eq(1)
          expect(comment6.likes.count).to eq(1)
        end

        it "user has reputation to reflect other users likes on their content" do
          like4 = Like.create(user: user2, liked: problem, category: "like")
          expect(user.reputation).to eq(1)
        end
      end
    end
  end
end