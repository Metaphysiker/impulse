class Cv < ApplicationRecord
  has_many :user_cvs
  has_many :users, :through => :user_cvs
  has_one_attached :odt
  has_one_attached :pdf

  def self.available_templates
   ["stats", "orangeblock", "wave", "blueblock", "bubbles", "dotty", "bluetop", "greenblock", "greenleft", "substantial", "bluey", "simple", "classical", "red", "personal"]
  end
end
