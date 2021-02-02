class Participant < ApplicationRecord

  def method_missing(method, *args, &block)
    false
  end

end
