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

    it 'see username ' do
      expect(page).to have_content(author.name)
    end

    it 'sees Number of posts' do
      expect(page).to have_content('Number of Posts: 4')
    end

    it 'sees bio of the user ' do
      expect(page).to have_content(author.bio)
    end

    it 'user\'s first three posts are shown' do
      posts = page.all('.post-item')
      expect(posts.size).to eq(3)
    end

    it 'shows a button with text See more' do
      within('button.more-posts-button') do
        expect(page).to have_content('See more')
      end
    end

    end
  end
end
