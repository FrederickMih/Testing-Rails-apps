require 'rails_helper'

RSpec.describe Leader, type: :model do
  let(:leader) { FactoryBot.build(:leader) }
  let(:group) { FactoryBot.build(:group) }

  context "Should validate" do
    it "the presence of first name, second name, email and phone number" do
      expect(leader).to be_valid
    end
  end

  context "Should not validates" do
    it "when the first name is not presence" do 
      leader.first_name = nil
      expect(leader).not_to be_valid
    end

    it "when the second name is not presence" do 
      leader.last_name = nil
      expect(leader).not_to be_valid
    end
    
    it "when the email is not presence" do 
      leader.email = nil
      expect(leader).not_to be_valid
    end

    it "when the phone number is not presence" do 
      leader.phone_number = nil
      expect(leader).not_to be_valid
    end
  end

  context "Group name" do
    it "should return No Group for this Leader if leader is not presence" do
      group.leader = nil
      expect(leader.group_name).to eq "No Group for this Leader"
    end

  end
end
