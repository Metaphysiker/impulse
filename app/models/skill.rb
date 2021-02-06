class Skill < ApplicationRecord
  belongs_to :user

  scope :ilike, ->(search_term) { where("title ILIKE ?", search_term) }

  def self.categories
    ["needed", "offered"]
  end
end
