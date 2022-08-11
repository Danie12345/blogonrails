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
end
