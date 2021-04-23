class SupportRequestExpertise  < ApplicationRecord
  belongs_to :support_request
  belongs_to :expertise
end
