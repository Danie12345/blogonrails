require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context "when client displays all users (#index)" do
    it "should return a correct (OK) status response" do
      get "/users"
      expect(response).to have_http_status(:ok)
    end

    it "should render the correct template" do
      expect(response).to render_template(:index)
    end

    it "should contain the correct placeholder text in the body"
  end

  context "when client displays a single user (#show)" do
    it "should return a correct (OK) status response"
    it "should render the correct template"
    it "should contain the correct placeholder text in the body"
  end
end
