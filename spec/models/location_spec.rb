require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:user) { User.create(user_name: "New User", display_name: "Freddy Mercury", country: "England", email: "yep", password: "nope") }
  let(:lost_item) { LostItem.create(user: user, name: "item that you lost", description: "(optional) Description of the lost item") }
  let(:location) { Location.create(user: user, lost_item: lost_item, name: "behind the fridge", description: "(Optional) More details on where to look behind the fridge")
  }

  it "is invalid without a user" do
    location.user = nil
    expect(location.valid?).to be false
  end

  it "is invalid without a lost item" do
    location.lost_item = nil
    expect(location.valid?).to be false
  end

  it "is invalid without a name" do
    location.name = nil
    expect(location.valid?).to be false
  end

  it "is valid with user, lost item and name" do
    expect(location.valid?).to be true
  end

  describe 'validations:' do
    let(:invalid) { Location.new }

    it 'validates name' do 
      invalid.valid?
      expect(invalid.errors[:name].size).to eq(1)
    end
  end
end