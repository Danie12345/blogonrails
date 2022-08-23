require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  subject!(:author) { User.where(name: 'Tom').first }
  subject!(:lilly) { User.where(name: 'Lilly').first }
  let!(:post) { author.most_recent_posts[0] }

  before(:all) do
    Capybara.configure do |config|
      config.run_server = false
    end
    Capybara::Session.new(:selenium)
    Rails.application.load_seed
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

  describe 'show page' do
    before(:example) do
      visit user_path(author.id)
    end

    it 'shows user\'s profile picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'see username' do
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

    it 'redirects to post\'s index page' do
      first(:link, 'See more').click
      expect(page).to have_current_path user_posts_path(author.id)
    end

    it 'redirects to the post show page when clicking on the title' do
      click_on(post.title)
      expect(page).to have_current_path user_post_path(author.id, post.id)
    end
  end
end
