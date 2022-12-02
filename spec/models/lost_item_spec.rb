require 'rails_helper'

RSpec.describe LostItem, type: :model do
  let(:user) { User.create(username: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:lost_item) { LostItem.create(user: user, name: "item that you lost", description: "(optional) Description of the lost item") }

  it "is invalid without a user" do
    lost_item.user = nil
    expect(lost_item.valid?).to be false
  end

  it "is invalid without a name" do
    lost_item.name = nil
    expect(lost_item.valid?).to be false
  end

  it "is valid with user and name" do
    expect(lost_item.valid?).to be true
  end

  describe 'validations:' do
    let(:invalid) { LostItem.new }

    it 'validates name' do 
      invalid.valid?
      expect(invalid.errors[:name].size).to eq(1)
    end
  end
end