class CvUnit < ApplicationRecord
  belongs_to :user

  def self.categories
    ["experience", "education", "skills", "reserve1", "reserve2"]
  end

  def content_html_safe
    self.content.html_safe
  end

  def content_split_by_new_line
    self.content_html_safe.split("\n")
  end

  def start_date_year
    unless self.start_date.blank?
      "#{I18n.l(self.start_date, format: :year)}"
    else
      ""
    end
  end

  def end_date_year
    unless self.end_date.blank?
      "#{I18n.l(self.end_date, format: :year)}"
    else
      ""
    end
  end

  def start_date_month_year_old
    unless self.start_date.blank?
      "#{I18n.l(self.start_date, format: :month_year)}"
    else
      ""
    end
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
