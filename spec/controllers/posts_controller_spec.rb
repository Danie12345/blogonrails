require 'rails_helper'

RSpec.describe PostsController, type: :request do
  User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  
  context "when client displays all posts from a user (#index)" do
    before(:each) { get "/users/864/posts" }

    it "should return a correct (OK) status response" do
      expect(response).to have_http_status(:ok)
    end

    it "should render the correct template" do
      expect(response).to render_template(:index)
    end

    it "should contain the correct placeholder text in the body" do
      expect(response.body).to include("Hello posts index!")
    end
  end

  context "when client displays a single post from a user (#show)" do
    it "should return a correct status response"
    it "should render the correct template"
    it "should contain the correct placeholder text in the body"
  end
end
