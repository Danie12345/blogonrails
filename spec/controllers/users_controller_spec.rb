require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context 'when client displays all users (#index)' do
    before(:each) { get users_path }

    it 'should return a correct (OK) status response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should contain the correct placeholder text in the body' do
      expect(response.body).to include('Hello users index!')
    end
  end

  context 'when client displays a single user (#show)' do
    user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

    before(:each) { get "/users/#{user.id}" }

    it 'should return a correct (OK) status response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should contain the correct placeholder text in the body' do
      expect(response.body).to include('Hello individual user!')
    end
  end
end
