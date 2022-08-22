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

  describe 'show page' do
    before(:example) do
      visit user_path(author.id)
    end

    it 'shows user\'s profile picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'see profile picture for each user' do
      image = page.all('img')
      expect(image.size).to eq(5)
    end

    it 'sees Number of posts for each user' do
      expect(page).to have_content('Number of Posts: 4')
      expect(page).to have_content('Number of Posts: 3')
      expect(page).to have_content('Number of Posts: 2')
      expect(page).to have_content('Number of Posts: 1')
      expect(page).to have_content('Number of Posts: 0')
    end

    it 'renders user\'s show page when clicked' do
      first(:link, lilly.name).click
      expect(page).to have_current_path user_path(lilly.id)
      expect(page).to have_content(lilly.bio)
    end
  end
end
