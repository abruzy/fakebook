require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) }
  
  describe "association" do
    it { belong_to(:user) }
  end

  it 'is valid post if it has at least five character length content' do
    expect(Post.new).to be_valid
  end

  it 'is invalid post if it does not have content' do
    post.description = ''
    expect(post).not_to be_valid
  end

end