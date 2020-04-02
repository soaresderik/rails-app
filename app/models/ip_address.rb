class IpAddress < ApplicationRecord
  has_many :host, foreign_key: 'ip_addresses_id'

  validates :ip, presence: true
end
