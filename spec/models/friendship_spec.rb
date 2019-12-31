require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:friendship) { FactoryBot.build(:friendship) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end
end
