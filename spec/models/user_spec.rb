require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  describe 'User model' do
    it 'should have a name of type string' do
      expect(subject.name).to eq('Tom')
      expect(subject.name.class).to eq(String)
    end

    it 'should have an id of type integer' do
      expect(subject.id.class).to eq(Integer)
    end

    it 'should have a photo link of type string' do
      expect(subject.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
      expect(subject.photo.class).to eq(String)
    end

    it 'should have a bio of type string' do
      expect(subject.bio).to eq('Teacher from Mexico.')
      expect(subject.bio.class).to eq(String)
    end

    it 'should have a posts count starting at 0' do
      expect(subject.posts_counter).to eq(0)
    end

    it 'should have a created_at timestamp' do
      expect(subject.created_at.class).to eq(ActiveSupport::TimeWithZone)
    end

    it 'should have an updated_at timestamp' do
      expect(subject.updated_at.class).to eq(ActiveSupport::TimeWithZone)
    end

    it 'should have a method that returns at most the 3 most recent posts' do
      Post.create(author: subject, title: 'Hello 1', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello 2', text: 'This is my second post')
      Post.create(author: subject, title: 'Hello 3', text: 'This is my  third post')
      Post.create(author: subject, title: 'Hello 4', text: 'This is my fourth post')

      expect(subject.posts_counter).to eq(4)
      expect(subject.most_recent_posts.length).to eq(3)
    end

    it 'should validate a name that is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate a posts_counter to be greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
      subject.posts_counter = 0
      expect(subject).to be_valid
      subject.posts_counter = 1
      expect(subject).to be_valid
    end
  end
end
