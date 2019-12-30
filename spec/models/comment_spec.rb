require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.build(:comment) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'post associations' do
    it { should belong_to(:post) } 
  end

  describe "user association" do
    it { should belong_to(:user) } 
  end
  
  it 'is a valid comment' do
    expect(comment).to be_valid
  end

  it 'is invalid when comment does not contain body' do
    comment.body = ''
    expect(comment).not_to be_valid
  end

  it 'is valid when comment contains body' do
    comment.body = 'Nice work'
    expect(comment).to be_valid
  end
end
