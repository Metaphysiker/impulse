class SupportRequest < ApplicationRecord
  has_many :support_request_users
  has_many :support_requests, :through => :support_request_users
  has_many :support_request_expertises
  has_many :expertises, :through => :support_request_expertises
  has_many :comments, as: :commentable
end
