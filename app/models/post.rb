require_relative 'application_record'

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_save :increment_user_post_count

  validates :title, length: { maximum: 251 }, allow_blank: false
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  def allcomments
    comments.includes([:author]).order(created_at: :desc)
  end

  def most_recent_comments
    allcomments.limit(5)
  end

  private

  def increment_user_post_count
    author.increment!(:posts_counter)
  end
end
