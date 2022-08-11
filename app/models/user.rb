require_relative 'application_record'

class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0}

  scope :most_recent_posts, ->(id) { from_user(id).posts.order(created_at: :desc).limit(3) }
  
  private

  scope :from_user, ->(id) { where(id:)[0] }
end
