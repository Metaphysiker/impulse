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

  def start_date_month_year_old
    unless self.start_date.blank?
      "#{I18n.l(self.start_date, format: :month_year)}"
    else
      ""
    end
  end

  def start_date_month_year
    month = self.start_date_month == 0 || self.start_date_month.blank? ? "" : I18n.t("date.month_names")[self.start_date_month]
    year = self.start_date_year == 0 ? "" : self.start_date_year.to_s
    [month, year].reject(&:empty?).join(' ')
  end

  def end_date_month_year
    month = self.end_date_month == 0 || self.end_date_month.blank? ? "" : I18n.t("date.month_names")[self.end_date_month]
    year = self.end_date_year == 0 ? "" : self.end_date_year.to_s
    [month, year].reject(&:empty?).join(' ')
  end

end
