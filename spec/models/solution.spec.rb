require 'rails_helper'

RSpec.describe Solution, type: :model do
  let(:user) { User.create(user_name: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:problem) { Problem.create(user: user, title: "This is a problem", description: "Description of the problem") }
  let(:solution) { Solution.create(user: user, problem: problem, description: "Description of the solution")
  }

  it "is invalid without a user" do
    solution.user = nil
    expect(solution.valid?).to be false
  end

  it "is invalid without a problem" do
    solution.problem = nil
    expect(solution.valid?).to be false
  end

  it "is invalid without a description" do
    solution.description = nil
    expect(solution.valid?).to be false
  end

  it "is valid with user, problem and description" do
    expect(solution.valid?).to be true
  end

  describe 'validations:' do
    let(:invalid) { Solution.new }

    it 'validates description' do 
      invalid.valid?
      expect(invalid.errors[:description].size).to eq(1)
    end
  end
end