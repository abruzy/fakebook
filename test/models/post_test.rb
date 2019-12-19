require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    Rails.application.load_seed 
    @post = Post.new(description: 'Here we come', image: 'bkbkfkaou', user_id: 1)
  end
  test "the truth" do
    @post.save
    assert @post.valid?
  end
end
