require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.build(:like) }

  describe 'post associations' do
    it { should belong_to(:post) } 
  end

  describe "user association" do
    it { should belong_to(:user) } 
  end
  
  it 'is a valid comment' do
    expect(like).to be_valid
  end
end
