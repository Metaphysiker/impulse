class Slide < ApplicationRecord
has_many :account_slides
has_many :accounts, :through => :account_slides
  has_many :account_slides
  has_many :accounts, :through => :account_slides
  has_many :options

  validates :name, uniqueness: true

  def self.show_suggestion_options
    ["yes", "no"]
  end

  def self.starting_slide_options
    ["yes", "no"]
  end

end
