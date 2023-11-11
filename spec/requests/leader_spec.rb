require 'rails_helper'

RSpec.describe "Leaders", type: :request do
    let(:leader) { FactoryBot.create(:leader) }
    
    context "Get /index" do
        it "should render the leader index page" do
            get leaders_path
            expect(response).to render_template :index
        end
    end

    context "New /new" do
        it "should render new page" do
            get new_leader_path
            expect(response).to render_template :new
        end
    end

    context "Edit /edit" do
        it "should render the edit page" do
            get edit_leader_path(leader)
            expect(response).to render_template :edit
        end
    end

    context "Post /leader" do
        it "should create a leader with valid attributes" do
            post "/leaders", params: {leader: FactoryBot.attributes_for(:leader)}
            expect(response).to redirect_to leaders_path
            expect(flash[:notice]).to eq "Leader has created successfully"
        end
    end

    context "Post /leader" do
        it "should not create a leader with invalid attributes" do
            post "/leaders", params: { leader: FactoryBot.attributes_for(:leader, first_name: nil)}
            expect(response).to render_template :new
            expect(flash[:notice]).to eq nil
        end
    end

    context "Put /leader" do
        it "should update a leader with valid attributes" do
            put "/leaders/#{leader.id}", params: {leader: FactoryBot.attributes_for(:leader)}
            expect(response).to redirect_to leaders_path
            expect(flash[:notice]).to eq "Leader has updated successfully"
        end
    end

    context "Put /leader" do
        it "should not update a leader with invalid attributes" do
            put "/leaders/#{leader.id}", params: {leader: FactoryBot.attributes_for(:leader, first_name: nil)}
            expect(response).to render_template :edit
            expect(flash[:notice]).to eq nil
        end
    end

    context "Delete /leader" do
        it "should destroy a leader" do
            delete "/leaders/#{leader.id}"
            expect(response).to redirect_to leaders_path
            expect(flash[:notice]).to eq "Leader has deleted successfully"
        end
    end
end


