require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(title: 'Post One', text: 'This is the post one') }

  it 'Title attribute should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title attribute should be less than 250 charachter' do
    subject.title = Faker::String.random(length: 300) # More than 250 charachter
    expect(subject).to_not be_valid
  end

  it 'Comments Counter attribute should be an integer number' do
    subject.comments_counter = 'some random string'
    expect(subject).to_not be_valid
  end

  it 'Comments Counter attribute should be greater or equal to zero' do
    subject.comments_counter = -4
    expect(subject).to_not be_valid
  end

  it 'Likes Counter attribute should be an integer number' do
    subject.likes_counter = 'some random string'
    expect(subject).to_not be_valid
  end

  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.likes_counter = -4
    expect(subject).to_not be_valid
  end
end
