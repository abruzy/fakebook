require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'john', last_name: 'doe', email: 'johndoe1@gmail.com', address: 'mende', password: '1234562', password_confirmation: '1234562')
    @user.save

    @post = @user.posts.new(description: 'Here we come', image: 'vffdnvxkkf')
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'description must not be present' do
    @post.description = ''
    assert @post.valid?
  end

  test 'description should be present' do
    @post.description = 'Here we come again'
    assert @post.valid?
  end

  test 'post should belong to user' do
    @post.save
    user_name = @user.first_name
    assert_equal user_name, @post.user.first_name
  end
end
