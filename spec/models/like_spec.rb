# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.build(:like) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
