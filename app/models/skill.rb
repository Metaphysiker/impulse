class Skill < ApplicationRecord
  belongs_to :user

  def self.categories
    ["needed", "offered"]
  end
end
