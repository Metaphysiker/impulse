class Cv < ApplicationRecord
  has_many :user_cvs
  has_many :users, :through => :user_cvs
  has_one_attached :odt
  has_one_attached :pdf

  def self.available_templates
   ["leftblack", "stats", "orangeblock", "wave", "blueblock", "bubbles", "dotty", "greenblock", "greenleft", "substantial", "bluey", "simple", "classical", "red"]
  end
end
