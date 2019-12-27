require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) }

  # describe "validations" do
  #   it { is_expected.to validate_presence_of(:description) }
  #   it { should ensure_length_of(:description).is_at_least(5) }
  # end

  describe "association" do
    it { belong_to(:user) }
  end

  it 'is valid post if it has at least five character length content' do
    expect(post).to be_valid
  end

  it 'is invalid post if it does not have content' do
    post.description = ''
    expect(post).not_to be_valid
  end

end