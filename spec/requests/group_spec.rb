require 'rails_helper'

RSpec.describe "Groups", type: :request do
  let(:group) { FactoryBot.create(:group) }

  context "Get /index" do
    it "should render group index page" do
      get groups_path
      expect(response).to render_template :index
    end
  end

  context "Get /new" do
    it "should render group new page" do
      get new_group_path
      expect(response).to render_template :new
    end
  end

  context "Get /edit" do
    it "should render group edit page" do
      get edit_group_path(group)
      expect(response).to render_template :edit
    end
  end

  context "Post /group" do
    it "should create a group with valid attributes" do
      post '/groups', params: {group: FactoryBot.attributes_for(:group)}
      expect(response).to redirect_to groups_path
      expect(flash[:notice]).to eq "Group successfully created"
    end

    it "should not create a group with invalid attributes" do
      post '/groups', params: {group: FactoryBot.attributes_for(:group, name: nil)}
      expect(response).to render_template :new
      expect(flash[:notice]).to eq nil
    end
  end

  context "Put /group" do
    it "should update a group with valid attributes" do
      put "/groups/#{group.id}", params: {group: FactoryBot.attributes_for(:group)}
      expect(response).to redirect_to groups_path
      expect(flash[:notice]).to eql "Group has successfully updated"
    end

    it "should not update a group with invalid attributes" do
      put "/groups/#{group.id}", params: {group: FactoryBot.attributes_for(:group, size: nil)}
      expect(response).to render_template :edit
      expect(flash[:notice]).to eql nil
    end
  end

  context "Delete /group" do
    it "should delete a group" do
      delete "/groups/#{group.id}"
      expect(response).to redirect_to groups_path
      expect(flash[:notice]).to eq "Group has deleted successfully"
    end
  end

end