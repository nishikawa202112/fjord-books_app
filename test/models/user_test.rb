# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'followed_by?' do
    me = users(:alice)
    he = users(:bob)

    me.follow(he)
    assert he.followed_by?(me)
    me.unfollow(he)
    assert_not he.followed_by?(me)
  end
  test 'follow' do
    me = users(:alice)
    he = users(:bob)

    assert_not me.following?(he)
    me.follow(he)
    assert me.following?(he)
  end
  test 'unfollow' do
    me = users(:alice)
    he = users(:bob)

    me.follow(he)
    assert me.following?(he)
    me.unfollow(he)
    assert_not me.following?(he)
  end
  test 'name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')

    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
