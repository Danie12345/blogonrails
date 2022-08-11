require_relative 'application_record'

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :increment_post_comment_count

  private

  def increment_post_comment_count
    post.comments_counter.nil? ? post.update(comments_counter: 1) : post.increment!(:comments_counter)
  end
end
