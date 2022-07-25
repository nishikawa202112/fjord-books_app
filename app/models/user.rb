# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_user_relationships,
           class_name: 'UserRelationship',
           foreign_key: 'follower_id',
           inverse_of: :follower,
           dependent: :destroy
  has_many :passive_user_relationships,
           class_name: 'UserRelationship',
           foreign_key: 'followed_id',
           inverse_of: :followed,
           dependent: :destroy

  has_many :followings, through: :active_user_relationships, source: :followed
  has_many :followers, through: :passive_user_relationships, source: :follower

  def follow(other_user)
    active_user_relationships.create(followed_id: other_user)
  end

  def unfollow(other_user)
    active_user_relationships.find_by(followed_id: other_user).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
