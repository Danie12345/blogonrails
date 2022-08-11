require_relative 'application_record'

class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'

  scope :from_user, ->(name) { where(name: name) }
  scope :most_recent_posts, ->(name) { from_user(name)[0].posts.order(created_at: :desc).limit(3) }
end
