class CvUnit < ApplicationRecord
  belongs_to :user

  def self.categories
    ["experience", "education", "skills"]
  end

  def content_html_safe
    self.content.html_safe
  end

  def start_date_month_year
    unless self.start_date.blank?
      "#{I18n.l(self.start_date, format: :month_year)}"
    else
      ""
    end
  end

  def end_date_month_year
    unless self.end_date.blank?
      "#{I18n.l(self.end_date, format: :month_year)}"
    else
      ""
    end
  end

end
