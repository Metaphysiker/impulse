class CvUnit < ApplicationRecord
  belongs_to :user

  def self.categories
    ["experience", "education", "skills"]
  end
end
