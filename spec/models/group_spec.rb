require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.build(:group) }
  let(:leader) { FactoryBot.build(:leader) }

  context "Should validate" do
    it "the presence of name, description, group type and size of the group" do
     expect(group).to be_valid
    end

    it "when leader is not presence" do
      group.leader = nil
      expect(group).to be_valid
    end
  end

  context "Should not be valid" do
    it "when name is not presence" do
      group.name = nil
      expect(group).not_to be_valid
    end

    it "when description is not presence" do
      group.description = nil
      expect(group).not_to be_valid
    end

    it "when group type is not presence" do
      group.group_type = nil
      expect(group).not_to be_valid
    end
  end

  context "Size" do
    it "should not be valid when size is not presence" do
      group.size = nil
      expect(group).not_to be_valid
    end

    it "should not be valid when size is greater than 10" do
      group.size = 11
      expect(group).not_to be_valid
    end

    it "should valid when size is equal to 10" do
      group.size = 10
      expect(group).to be_valid
    end

    it "should valid when size is less than 10" do
      group.size = 6
      expect(group).to be_valid
    end
  end

  context "Leader name" do
    it "should return No leader for this group when leader is not presence" do
      group.leader = nil
      expect(group.leader_name).to eq 'No leader for this group'
    end

    it "should return full name when leader is presence" do
      leader.first_name = "Mih"
      leader.last_name = "Fred"
      group.leader = leader
      expect(group.leader_name).to eq "Mih Fred"
    end
  end
end
