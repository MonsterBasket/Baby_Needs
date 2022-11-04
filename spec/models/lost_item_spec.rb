require 'rails_helper'
require 'pry'

RSpec.describe LostItem, type: :model do
  let(:user) { User.create(user_name: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:lost_item) { LostItem.create(user: user, name: "item that you lost", description: "(optional) Description of the lost item") }

  it "is invalid without a user" do
    problem.user = nil
    expect(problem.valid?).to be false
  end

  it "is invalid without a name" do
    problem.name = nil
    expect(problem.valid?).to be false
  end

  it "is valid with user and name" do
    expect(problem.valid?).to be true
  end

  describe 'validations:' do
    let(:invalid) { Problem.new }

    it 'validates name' do 
      expect(invalid).to have(1).error_on(:name)
    end
  end
end