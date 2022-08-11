require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
  
  post = Post.create(author: user, title: 'Hello 1', text: 'This is my first post')
  
  subject = Like.create(post: post, author: user)
  
  it "should have an author of type User" do
    expect(subject.author).to eq(user)
    expect(subject.author.class).to eq(User)
  end
  
  it "should have a post of type Post" do
    expect(subject.post).to eq(post)
    expect(subject.post.class).to eq(Post)
  end
  
  it "should have an id of type integer" do
    expect(subject.id.class).to eq(Integer)
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

  it "should validate the foreign key reference to the post" do
    expect(subject.post.id).to eq(post.id)
  end

  it "should have a method that increments posts like counter" do
    expect(subject.post.likes_counter).to eq(1)
  end

  it "should have a private method that increments posts like counter" do
    subject.send(:increment_post_like_count)
    expect(subject.post.likes_counter).to eq(2)
  end
end
