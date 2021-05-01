class SupportRequestUser  < ApplicationRecord
  belongs_to :support_request
  belongs_to :user
end
