require_relative 'application_record'

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_save :increment_user_post_count

  scope :most_recent_comments, ->(id) { from_post(id).comments.order(created_at: :desc).limit(5) }
  
  private
  
  scope :from_post, ->(id) { where(id:)[0] }

  def increment_user_post_count
    author.increment!(:posts_counter)
  end
end
