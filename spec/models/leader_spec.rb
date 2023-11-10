require 'rails_helper'

RSpec.describe Leader, type: :model do
  let(:leader) { FactoryBot.build(:leader) }

  context "Should validate" do
    it "the presence of first name, second name, email and phone number" do
      expect(leader).to be_valid
    end

    it "the presence of a group" do
      expect(leader.group).to be_valid
    end
  end
end
