require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }
  
  it "should have a name of type string" do
    expect(subject.name).to eq('Tom')
    expect(subject.name.class).to eq(String)
  end
  
  it "should have an id of type integer" do
    expect(subject.id.class).to eq(Integer)
  end
  
  it "should have a photo link of type string" do
    expect(subject.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
    expect(subject.photo.class).to eq(String)
  end
  
  it "should have a bio of type string" do
    expect(subject.bio).to eq('Teacher from Mexico.')
    expect(subject.bio.class).to eq(String)
  end

  it "should have a posts count starting at 0" do
    expect(subject.posts_counter).to eq(0)
  end

  it "should have a created_at timestamp" do
    expect(subject.created_at.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "should have a updated_at timestamp" do
    expect(subject.updated_at.class).to eq(ActiveSupport::TimeWithZone)
  end

  it "should have a method that returns at most the 3 most recent posts" do
    first_post = Post.create(author: subject, title: 'Hello 1', text: 'This is my first post')
    second_post = Post.create(author: subject, title: 'Hello 2', text: 'This is my second post')
    third_post = Post.create(author: subject, title: 'Hello 3', text: 'This is my  third post')
    fourth_post = Post.create(author: subject, title: 'Hello 4', text: 'This is my fourth post')

    expect(subject.posts_counter).to eq(4)
    expect(User.most_recent_posts(subject.id).length).to eq(3)
  end
end
