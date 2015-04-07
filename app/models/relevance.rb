class Relevance < ActiveRecord::Base
  validates :query, uniqueness: true
end
