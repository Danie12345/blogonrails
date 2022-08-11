class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def initialize(params = {})
    super(params)
  end
end
