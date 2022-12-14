require 'rails_helper'

RSpec.describe Problem, type: :model do
  let(:user) { User.create(username: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:problem) { Problem.create(user: user, title: "This is a problem", description: "Description of the problem") }

  it "is invalid without a title" do
    problem.title = nil
    expect(problem.valid?).to be false
  end

  it "is invalid without a user" do
    problem.user = nil
    expect(problem.valid?).to be false
  end

  it "is invalid without a description" do
    problem.description = nil
    expect(problem.valid?).to be false
  end

  it "is valid with title and description" do
    expect(problem.valid?).to be true
  end

  describe 'validations:' do
    let(:invalid) { Problem.new }

    it 'validates title' do 
      invalid.valid?
      expect(invalid.errors[:title].size).to eq(1)
    end
  end
end