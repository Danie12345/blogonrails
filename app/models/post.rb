require_relative 'application_record'

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_save :increment_user_post_count

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_post_count
    author.posts_counter.nil? ? author.update(posts_counter: 1) : author.increment!(:posts_counter)
  end
end
