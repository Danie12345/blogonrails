require 'rails_helper'

RSpec.describe 'Users', type: :system do
  subject!(:author) { User.where(name: 'Tom').first }
  subject!(:lilly) { User.where(name: 'Lilly').first }
  let!(:post) { Post.where(title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit').first }

  before(:all) do
    Rails.application.load_seed
    driven_by(:selenium_chrome_headless)
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  describe 'index page' do
    before(:example) do
      visit root_path
    end

    it 'see username of all other users' do
      expect(page).to have_content(author.name)
      expect(page).to have_content(lilly.name)
      expect(page).to have_content('John')
      expect(page).to have_content('Jerry')
      expect(page).to have_content('Jane')
    end
  end
end
