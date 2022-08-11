require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  
  subject = Post.create(author: user, title: 'Hello 1', text: 'This is my first post')
  
  it "should have a title of type string" do
    expect(subject.title).to eq('Hello 1')
    expect(subject.title.class).to eq(String)
  end
  
  it "should have an id of type integer" do
    expect(subject.id.class).to eq(Integer)
  end
  
  it "should have a text of type string" do
    expect(subject.text).to eq('This is my first post')
    expect(subject.text.class).to eq(String)
  end
  
  it "should have an author of type User" do
    expect(subject.author).to eq(user)
    expect(subject.author.class).to eq(User)
  end

  it "should have a created_at timestamp" do
    expect(subject.created_at.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "should have an updated_at timestamp" do
    expect(subject.updated_at.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "should validate the foreign key reference to the author" do
    expect(subject.author.id).to eq(user.id)
  end

  it "should have a method that increments user post count" do
    expect(user.posts_counter).to eq(1)
  end

  it "should have a private method that returns the user from an id" do
    expect(Post.send(:from_post, subject.id)).to eq(subject)
  end

  it "should validate a title that is not blank" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "should validate a title to be no longer than 250 characters" do
    subject.title = 'jmskdncjfnsdkjvfsnjvfnjjk eavjnvfkjnSome title that actually has more than 250 characters, '\
                    'and at some point it grew too big, so big in fact that the program was swallowed whole by '\
                    'it. Then, one day it decided to be even LONGER, so it just continued writing until the day was over123456.'
    expect(subject).to_not be_valid
    subject.title = 'Hello 1'
  end

  it "should validate a comments counter to be greater than or equal to 0" do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
    subject.comments_counter = 1
    expect(subject).to be_valid
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it "should validate a likes counter to be greater than or equal to 0" do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
    subject.likes_counter = 1
    expect(subject).to be_valid
    subject.likes_counter = 0
    expect(subject).to be_valid

  end
  
  it "should increment comments counter when adding a comment" do
    expect(subject.comments_counter).to eq(0)
    comment = Comment.create(post: subject, author: user, text: 'Bye Mom!')
    expect(subject.comments_counter).to eq(1)
  end
  
  it "should increment likes counter when adding a comment" do
    expect(subject.likes_counter).to eq(0)
    like = Like.create(post: subject, author: user)
    expect(subject.likes_counter).to eq(1)
  end
end
