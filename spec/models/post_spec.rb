require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:author) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

  subject!(:post) { Post.create(author:, title: 'Hello 1', text: 'This is my first post') }

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  describe 'Post model' do
    it 'should have a title of type string' do
      expect(post.title).to eq('Hello 1')
      expect(post.title.class).to eq(String)
    end
  
    it 'should have an id of type integer' do
      expect(post.id.class).to eq(Integer)
    end
  
    it 'should have a text of type string' do
      expect(post.text).to eq('This is my first post')
      expect(post.text.class).to eq(String)
    end
  
    it 'should have an author of type User' do
      expect(post.author).to eq(author)
      expect(post.author.class).to eq(User)
    end
  
    it 'should have a created_at timestamp' do
      expect(post.created_at.class).to eq(ActiveSupport::TimeWithZone)
    end
  
    it 'should have an updated_at timestamp' do
      expect(post.updated_at.class).to eq(ActiveSupport::TimeWithZone)
    end
  
    it 'should validate the foreign key reference to the author' do
      expect(post.author.id).to eq(author.id)
    end
  
    it 'should have a method that increments user post count' do
      expect(author.posts_counter).to eq(1)
    end
  
    it 'should have a method that returns the top 5 recent comments' do
      Comment.create(post:, author:, text: 'Bye Mom!')
      Comment.create(post:, author:, text: 'Bye Mom!')
      Comment.create(post:, author:, text: 'Bye Mom!')
      Comment.create(post:, author:, text: 'Bye Mom!')
      Comment.create(post:, author:, text: 'Bye Mom!')
      Comment.create(post:, author:, text: 'Bye Mom!')
  
      expect(post.comments_counter).to eq(6)
      expect(post.most_recent_comments.length).to eq(5)
    end
  
    it 'should validate a title that is not blank' do
      post.title = nil
      expect(post).to_not be_valid
    end
  
    it 'should validate a title to be no longer than 250 characters' do
      post.title = 'jmskdncjfnsdkjvfsnjvfnjjk eavjnvfkjnSome title that actually has more than 250 characters, ' \
                      'and at some point it grew too big, so big in fact that the program was swallowed whole by ' \
                      'it. Then, one day it decided to be even LONGER, so it just continued writing until the day ' \
                      'was over123456.'
      expect(post).to_not be_valid
      post.title = 'Hello 1'
    end
  
    it 'should validate a comments counter to be greater than or equal to 0' do
      post.comments_counter = -1
      expect(post).to_not be_valid
      post.comments_counter = 1
      expect(post).to be_valid
      post.comments_counter = 0
      expect(post).to be_valid
    end
  
    it 'should validate a likes counter to be greater than or equal to 0' do
      post.likes_counter = -1
      expect(post).to_not be_valid
      post.likes_counter = 1
      expect(post).to be_valid
      post.likes_counter = 0
      expect(post).to be_valid
    end
  
    it 'should increment comments counter when adding a comment' do
      expect(post.comments_counter).to eq(0)
      Comment.create(post:, author:, text: 'Bye Mom!')
      expect(post.comments_counter).to eq(1)
    end
  
    it 'should increment likes counter when adding a comment' do
      expect(post.likes_counter).to eq(0)
      Like.create(post:, author:)
      expect(post.likes_counter).to eq(1)
    end
  end
end
