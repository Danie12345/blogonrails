require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let!(:author) { User.where(name: 'Tom').first }
  let!(:lilly) { User.where(name: 'Lilly').first }
  subject!(:post) { Post.where(title: 'Fourth Post').first }
  let!(:comment) { post.comments[2] }

  before(:all) do
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
      visit user_posts_path(author.id)
    end

    it 'shows user\'s profile picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'shows user\'s username' do
      expect(page).to have_content(author.name)
    end

    it 'shows number of posts by that user' do
      expect(page).to have_content('Number of Posts: 4')
    end

    it 'shows title of post' do
      expect(page).to have_content(post.title)
    end

    it 'shows post\'s body' do
      expect(page).to have_content(post.text[0..50])
    end

    it 'shows the first comments on a post' do
      expect(page).to have_content(comment.text)
    end

    it 'shows number of comments the post has' do
      expect(page).to have_content('Comments 0')
    end

    it 'shows how many likes the post has' do
      expect(page).to have_content('Likes 1')
    end

    it 'has pagination button' do
      expect(page).to have_content('Pagination')
    end

    it 'redirects to the post show page when clicking on the title' do
      click_on(post.title)
      expect(page).to have_current_path user_post_path(author.id, post.id)
      expect(page).to have_content(post.title)
    end
  end
end
