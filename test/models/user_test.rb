# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
    me.unfollow(she)
    assert_not she.followed_by?(me)
  end
  test 'name or email' do
    user = User.new(email: 'foo@example.com', name: '')

    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
