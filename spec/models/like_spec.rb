# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.build(:like) }
  let(:post) { FactoryBot.build(:post) }
  let(:user) { FactoryBot.build(:user) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  # context 'when user likes posts' do
  #   it 'increases number of posts likes by one' do
  #     user.likes << post
  #     expect(user.like.count).to eq 1
  #   end
  # end

  it "user is present" do
    expect(like.user).to be_present
  end

  it "post is present" do
    expect(like.post).to be_present
  end

  context 'when user is deleted' do
    it 'is expected to destroy dependent likes' do
      user.destroy
      expect(Like.find_by(id: like.id)).to be_nil
    end
  end

  context 'when post is deleted' do
    it 'is expected to destroy dependent likes' do
      user.posts.destroy
    expect(Like.find_by(id: like.id)).to be_nil
    end
  end
end
