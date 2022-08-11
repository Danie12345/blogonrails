require_relative 'application_record'

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :increment_post_like_count

  private

  def increment_post_like_count
    post.increment!(:likes_counter)
  end
end
