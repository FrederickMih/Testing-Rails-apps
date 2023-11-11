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

  context "Phone number format" do
    it "should not be valid if phone number is of wrong format" do
      leader.phone_number = "334555666787"
      expect(leader).not_to be_valid
    end

    it "should be valid if phone number is of correct formate" do
      leader.phone_number = "336-777-7025"
      expect(leader).to be_valid
    end
  end

  context "Email format" do
    it "should not be valid if email is of wrong format" do
      leader.email = "fred_gmail.com"
      expect(leader).not_to be_valid
    end

    it "should be valid if email is of correct formate" do
      leader.email = "fred@gmail.com"
      expect(leader).to be_valid
    end
  end

  context "Full name" do
    it "should expect full name to be Mih Fred" do
      leader.first_name = "Mih"
      leader.last_name = "Fred"
      expect(leader.full_name).to eq "Mih Fred"
    end
  end

 

  context "Group name" do
    it "should return No Group for this Leader if leader is not presence" do
      group.leader = nil
      expect(leader.group_name).to eq "No Group for this Leader"
    end
    
    it "should return name of the group when group is present" do
      group.name = "GCU"
      leader.group = group
      expect(leader.group_name).to eql "GCU"
    end
  end
end
