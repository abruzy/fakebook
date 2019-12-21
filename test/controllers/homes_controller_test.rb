# frozen_string_literal: true

require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test 'should get the index page' do
    get '/'
    assert :success
  end
end
