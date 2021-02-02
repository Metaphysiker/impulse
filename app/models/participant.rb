class Participant < ApplicationRecord

  def self.statuses
    ["active", "inactive"]
  end

  def method_missing(method, *args, &block)
    false
  end

end
