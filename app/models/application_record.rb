class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
end

