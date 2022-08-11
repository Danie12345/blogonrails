require_relative 'application_record'

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_save :increment_user_post_count

  validates :title, length: { maximum: 251 }, allow_blank: false
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  scope :most_recent_comments, ->(id) { from_post(id).comments.order(created_at: :desc).limit(5) }

  private

  scope :from_post, ->(id) { where(id:)[0] }

  def increment_user_post_count
    author.increment!(:posts_counter)
  end
end
