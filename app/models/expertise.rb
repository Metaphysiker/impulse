class Expertise < ApplicationRecord
has_many :support_request_expertises
has_many :support_requests, :through => :support_request_expertises

  def self.expertises
    ["Lebenslauf", "Bewerbungstraining", "Networking"]
  end

end
